require "kemal"
require "kemal-flash"
require "hashr"

require "baked_file_system_mounter"
BakedFileSystemMounter.assemble(["public"])
BakedFileSystemStorage.mount
require "./gen_rand"
require "./archiver"
require "./contact"

Kemal::Session.config do |config|
  config.secret = "my_super_secret"
end

get_flashed_messages = ["success"]

get "/" do |env|
  env.redirect "/contacts"
end

get "/contacts/count" do |env|
  count = 100
  sleep 1
  "(#{count}) total Contacts"
end

get "/contacts" do |env|
  query = env.params.query["q"]?
  page = (env.params.query["page"]? || 1).to_i
  Archiver.reset

  if query.nil?
    contacts = Contact.all(page)

    render "src/views/index.ecr", "src/views/layouts/layout.ecr"
  else
    contacts = Contact.search(query)

    if env.request.headers["HX-Trigger"]? == "search"
      render "src/views/partials/search.ecr"
    else
      render "src/views/index.ecr", "src/views/layouts/layout.ecr"
    end
  end
end

get "/contacts/new" do |env|
  contact = Contact.new
  render "src/views/new.ecr", "src/views/layouts/layout.ecr"
end

get "/contacts/:id" do |env|
  id = env.params.url["id"]
  contact = Contact.new(
    first: "billy",
    last: "zheng",
    phone: "18620053121",
    email: "vil963@gmail.com",
    errors: {} of String => String,
  )

  render "src/views/show.ecr", "src/views/layouts/layout.ecr"
end

get "/contacts/:id/edit" do |env|
  id = env.params.url["id"]
  contact = Contact.new(
    first: "billy",
    last: "zheng",
    phone: "18620053121",
    email: "vil963@gmail.com",
    errors: {"email" => "error"},
  )
  render "src/views/edit.ecr", "src/views/layouts/layout.ecr"
end

get "/contacts/:id/email" do |env|
  "hello113"
end

post "/contacts/:id/edit" do |env|
  id = env.params.url["id"]
  contact = Contact.new(
    first: "billy",
    last: "zheng",
    phone: "18620053121",
    email: "vil963@gmail.com",
    errors: {} of String => String,
  )

  if contact.save
    env.flash["notice"] = "Updated Contact!"
    env.redirect "/contacts/#{contact.id}"
  else
    render "src/views/edit.ecr", "src/views/layouts/layout.ecr"
  end
end

delete "/contacts" do |env|
  ids = env.params.body.fetch_all("selected_contact_ids")
  env.flash["notice"] = "Deleted contacts"
  env.redirect "/contacts", 303
end

delete "/contacts/:id" do |env|
  id = env.params.url["id"]
  contact = Contact.new(
    first: "billy",
    last: "zheng",
    phone: "18620053121",
    email: "vil963@gmail.com",
    errors: {} of String => String,
  )

  contact.delete

  if env.request.headers["HX-Trigger"]? == "delete-btn"
    env.flash["notice"] = "Deleted Contact!"
    env.redirect "/contacts", 303
  else
    ""
  end
end

post "/contacts/new" do |env|
  body = env.params.body
  contact = Contact.new(
    first: body["first_name"],
    last: body["last_name"],
    phone: body["phone"],
    email: body["email"],
    errors: {} of String => String,
  )
  if contact.save
    env.flash["notice"] = "Created New Contacts!"
    env.redirect "/contacts"
  else
    render "src/views/new.ecr", "src/views/layouts/layout.ecr"
  end
end

post "/contacts/archive" do |env|
  Archiver.run
  render "src/views/partials/archive_ui.ecr"
end

get "/contacts/archive" do |env|
  render "src/views/partials/archive_ui.ecr"
end

delete "/contacts/archive" do |env|
  Archiver.reset
  render "src/views/partials/archive_ui.ecr"
end

get "/contacts/archive/file" do |env|
  env.response.headers["Content-Disposition"] = "attachment; filename=archive.json"
  send_file env, "contacts.json"
end

Kemal.run
