require "date"
require_relative "./key_makable"
require_relative "./alphabetable"
require_relative "./algorithm"


class Decrypter

  def find_character
    @message.map { |char| @characters.index(char) }
  end

  def rotation
    arr = find_character
    arr.map { |num| num -= shift(arr.index(num)) }
  end

  def decrypted_msg
    decrypted_msg = rotation
    decrypted_msg.join
    decrypted_msg.map { |num| @characters.index(num) }
  end

end
