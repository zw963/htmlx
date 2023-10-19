require "kemal"
require "kemal-flash"
require "hashr"

Kemal::Session.config do |config|
  config.secret = "my_super_secret"
end

class Contact
  property id : Int32, first : String?, last : String?, phone : String?, email : String?, errors = {} of String => String

  def initialize(@first, @last, @phone, @email, @errors)
    @id = 1
  end

  def initialize
    @id = 1
  end

  def save
    true
  end

  def delete
    true
  end

  def self.all(page)
    contacts =
      if page == 1
        [
          {
            id:     1,
            first:  "billy",
            last:   "zheng",
            phone:  "18620053121",
            email:  "vil963@gmail.com",
            errors: {} of String => String,
          },
          {
            id:     2,
            first:  "xuan",
            last:   "zheng",
            phone:  "13603579818",
            email:  "retired@qq.com",
            errors: {} of String => String,
          },
          {
            id:     3,
            first:  "juan",
            last:   "zheng",
            phone:  "15026846909",
            email:  "wj760527@163",
            errors: {"email" => "error"},
          },
          {
            id:     4,
            first:  "billy",
            last:   "zheng",
            phone:  "18620053121",
            email:  "vil963@gmail.com",
            errors: {} of String => String,
          },
          {
            id:     5,
            first:  "xuan",
            last:   "zheng",
            phone:  "13603579818",
            email:  "retired@qq.com",
            errors: {} of String => String,
          },
          {
            id:     6,
            first:  "juan",
            last:   "zheng",
            phone:  "15026846909",
            email:  "wj760527@163",
            errors: {"email" => "error"},
          },
          {
            id:     7,
            first:  "billy",
            last:   "zheng",
            phone:  "18620053121",
            email:  "vil963@gmail.com",
            errors: {} of String => String,
          },
          {
            id:     8,
            first:  "xuan",
            last:   "zheng",
            phone:  "13603579818",
            email:  "retired@qq.com",
            errors: {} of String => String,
          },
          {
            id:     9,
            first:  "juan",
            last:   "zheng",
            phone:  "15026846909",
            email:  "wj760527@163",
            errors: {"email" => "error"},
          },
          {
            id:     10,
            first:  "juan",
            last:   "zheng",
            phone:  "15026846909",
            email:  "wj760527@163",
            errors: {"email" => "error"},
          },
        ]
      elsif page == 2
        [
          {
            id:     11,
            first:  "11",
            last:   "zheng",
            phone:  "18620053121",
            email:  "vil963@gmail.com",
            errors: {} of String => String,
          },
          {
            id:     12,
            first:  "12",
            last:   "zheng",
            phone:  "13603579818",
            email:  "retired@qq.com",
            errors: {} of String => String,
          },
          {
            id:     13,
            first:  "13",
            last:   "zheng",
            phone:  "15026846909",
            email:  "wj760527@163",
            errors: {"email" => "error"},
          },
          {
            id:     14,
            first:  "14",
            last:   "zheng",
            phone:  "18620053121",
            email:  "vil963@gmail.com",
            errors: {} of String => String,
          },
          {
            id:     15,
            first:  "15",
            last:   "zheng",
            phone:  "13603579818",
            email:  "retired@qq.com",
            errors: {} of String => String,
          },
          {
            id:     16,
            first:  "16",
            last:   "zheng",
            phone:  "15026846909",
            email:  "wj760527@163",
            errors: {"email" => "error"},
          },
          {
            id:     17,
            first:  "17",
            last:   "zheng",
            phone:  "18620053121",
            email:  "vil963@gmail.com",
            errors: {} of String => String,
          },
          {
            id:     18,
            first:  "18",
            last:   "zheng",
            phone:  "13603579818",
            email:  "retired@qq.com",
            errors: {} of String => String,
          },
          {
            id:     19,
            first:  "19",
            last:   "zheng",
            phone:  "15026846909",
            email:  "wj760527@163",
            errors: {"email" => "error"},
          },
          {
            id:     20,
            first:  "20",
            last:   "zheng",
            phone:  "15026846909",
            email:  "wj760527@163",
            errors: {"email" => "error"},
          },
        ]
      else
        [
          {
            id:    21,
            first: "21",
            last:  "zheng",
            phone: "18620053121",
            email: "vil963@gmail.com",
          },
          {
            id:    22,
            first: "22",
            last:  "zheng",
            phone: "13603579818",
            email: "retired@qq.com",
          },
        ]
      end

    contacts.map { |e| Hashr.new(e) }
  end

  def self.search(query)
    contacts = case query
               when "zheng"
                 [
                   {
                     id:    1,
                     first: "billy",
                     last:  "zheng",
                     phone: "18620053121",
                     email: "vil963@gmail.com",
                   },
                   {
                     id:    2,
                     first: "xuan",
                     last:  "zheng",
                     phone: "13603579818",
                     email: "retired@qq.com",
                   },
                 ]
               when ""
                 [
                   {
                     id:     1,
                     first:  "billy",
                     last:   "zheng",
                     phone:  "18620053121",
                     email:  "vil963@gmail.com",
                     errors: {} of String => String,
                   },
                   {
                     id:     2,
                     first:  "xuan",
                     last:   "zheng",
                     phone:  "13603579818",
                     email:  "retired@qq.com",
                     errors: {} of String => String,
                   },
                   {
                     id:     3,
                     first:  "juan",
                     last:   "zheng",
                     phone:  "15026846909",
                     email:  "wj760527@163",
                     errors: {"email" => "error"},
                   },
                   {
                     id:     4,
                     first:  "billy",
                     last:   "zheng",
                     phone:  "18620053121",
                     email:  "vil963@gmail.com",
                     errors: {} of String => String,
                   },
                   {
                     id:     5,
                     first:  "xuan",
                     last:   "zheng",
                     phone:  "13603579818",
                     email:  "retired@qq.com",
                     errors: {} of String => String,
                   },
                   {
                     id:     6,
                     first:  "juan",
                     last:   "zheng",
                     phone:  "15026846909",
                     email:  "wj760527@163",
                     errors: {"email" => "error"},
                   },
                   {
                     id:     7,
                     first:  "billy",
                     last:   "zheng",
                     phone:  "18620053121",
                     email:  "vil963@gmail.com",
                     errors: {} of String => String,
                   },
                   {
                     id:     8,
                     first:  "xuan",
                     last:   "zheng",
                     phone:  "13603579818",
                     email:  "retired@qq.com",
                     errors: {} of String => String,
                   },
                   {
                     id:     9,
                     first:  "juan",
                     last:   "zheng",
                     phone:  "15026846909",
                     email:  "wj760527@163",
                     errors: {"email" => "error"},
                   },
                   {
                     id:     10,
                     first:  "juan",
                     last:   "zheng",
                     phone:  "15026846909",
                     email:  "wj760527@163",
                     errors: {"email" => "error"},
                   },
                 ]
               else
                 [] of Hash(String, String)
               end

    contacts.map { |e| Hashr.new(e) }
  end
end

get_flashed_messages = ["success"]

get "/" do |env|
  env.redirect "/contacts"
end

get "/contacts/count" do |env|
  sleep 2
  count = 100
  "(#{count}) total Contacts"
end

get "/contacts" do |env|
  query = env.params.query["q"]?
  page = (env.params.query["page"]? || 1).to_i
  count = 100

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

Kemal.run
