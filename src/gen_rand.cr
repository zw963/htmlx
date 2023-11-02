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
