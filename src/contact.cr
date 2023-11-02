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
