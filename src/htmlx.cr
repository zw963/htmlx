require "kemal"
require "kemal-flash"
require "hashr"

module RandomName
  extend self

  VERSION = "0.1.0"

  ALPHABET = "abcdefghijkmnopqrstuvwxyz".chars

  def random(chars : Int32)
    String.build(chars) do |sb|
      chars.times { sb << ALPHABET.sample }
    end
  end
end

module RandomNumber
  extend self

  VERSION = "0.1.0"

  ALPHABET = "0123456789".chars

  def random(chars : Int32)
    String.build(chars) do |sb|
      chars.times { sb << ALPHABET.sample }
    end
  end
end

module Archiver
  enum Status
    Waiting
    Running
    Complete
  end

  class_property status = Status::Waiting

  # 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0
  class_property progress = 0.0

  extend self

  def run
    if status.waiting?
      self.status = Status::Running
      self.progress = 0.0
      spawn run_impl
    end
  end

  def run_impl
    10.times do |i|
      sleep rand

      return unless status.running?

      self.progress = (i + 1)/10.0
      puts "Here...#{progress}"
    end

    sleep 1

    return unless status.running?

    self.status = Status::Complete
  end

  def archive_file
    "contacts.json"
  end

  def reset
    self.status = Status::Waiting
  end
end

Kemal::Session.config do |config|
  config.secret = "my_super_secret"
end

class Contact
  property id : Int32, first : String?, last : String?, phone : String?, email : String?, errors = {} of String => String

  # def self.random_name(string_length)
  #   rand(36**string_length).to_s(36)
  # end

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
      case page
      when 1
        (1..10).map do |i|
          rand_name = RandomName.random(5) + RandomNumber.random(3)
          {
            id:     i,
            first:  rand_name,
            last:   "zheng",
            phone:  "1862005#{rand(5000..9999)}",
            email:  "#{rand_name}@gmail.com",
            errors: {} of String => String,
          }
        end
      when 2
        (11..20).map do |i|
          rand_name = RandomName.random(5) + RandomNumber.random(3)
          {
            id:     i,
            first:  rand_name,
            last:   "zheng",
            phone:  "1862005#{rand(5000..9999)}",
            email:  "#{rand_name}@gmail.com",
            errors: {} of String => String,
          }
        end
      when 3
        (21..30).map do |i|
          rand_name = RandomName.random(5) + RandomNumber.random(3)
          {
            id:     i,
            first:  rand_name,
            last:   "zheng",
            phone:  "1862005#{rand(5000..9999)}",
            email:  "#{rand_name}@gmail.com",
            errors: {} of String => String,
          }
        end
      when 4
        (31..40).map do |i|
          rand_name = RandomName.random(5) + RandomNumber.random(3)
          {
            id:     i,
            first:  rand_name,
            last:   "zheng",
            phone:  "1862005#{rand(5000..9999)}",
            email:  "#{rand_name}@gmail.com",
            errors: {} of String => String,
          }
        end
      when 5
        (41..50).map do |i|
          rand_name = RandomName.random(5) + RandomNumber.random(3)
          {
            id:     i,
            first:  rand_name,
            last:   "zheng",
            phone:  "1862005#{rand(5000..9999)}",
            email:  "#{rand_name}@gmail.com",
            errors: {} of String => String,
          }
        end
      when 6
        (51..60).map do |i|
          rand_name = RandomName.random(5) + RandomNumber.random(3)
          {
            id:     i,
            first:  rand_name,
            last:   "zheng",
            phone:  "1862005#{rand(5000..9999)}",
            email:  "#{rand_name}@gmail.com",
            errors: {} of String => String,
          }
        end
      when 7
        (61..70).map do |i|
          rand_name = RandomName.random(5) + RandomNumber.random(3)
          {
            id:     i,
            first:  rand_name,
            last:   "zheng",
            phone:  "1862005#{rand(5000..9999)}",
            email:  "#{rand_name}@gmail.com",
            errors: {} of String => String,
          }
        end
      when 8
        (71..80).map do |i|
          rand_name = RandomName.random(5) + RandomNumber.random(3)
          {
            id:     i,
            first:  rand_name,
            last:   "zheng",
            phone:  "1862005#{rand(5000..9999)}",
            email:  "#{rand_name}@gmail.com",
            errors: {} of String => String,
          }
        end
      when 9
        (81..90).map do |i|
          rand_name = RandomName.random(5) + RandomNumber.random(3)
          {
            id:     i,
            first:  rand_name,
            last:   "zheng",
            phone:  "1862005#{rand(5000..9999)}",
            email:  "#{rand_name}@gmail.com",
            errors: {} of String => String,
          }
        end
      else
        [
          {
            id:    21,
            first: "Billy",
            last:  "zheng",
            phone: "18620053121",
            email: "vil963@gmail.com",
          },
          {
            id:    22,
            first: "retired",
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

get "/contacts/archive/file" do |env|
  env.response.headers["Content-Disposition"] = "attachment; filename=archive.json"
  send_file env, "contacts.json"
end

Kemal.run
