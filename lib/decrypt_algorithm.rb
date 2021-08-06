require "date"
require_relative "./key_makable"
require_relative "./alphabetable"

class DecryptAlgorithm

  include KeyMakable
  include Alphabetable
  
  attr_reader :message,
              :key,
              :date,
              :characters,
              :offset

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @offset = Offset.new
    @characters =("a".."z").to_a << " "
  end

  def split_msg(message)
    @message = message.split("")
  end

  def find_character
    @message.map { |char| @characters.index(char) }
  end

  def shift(index)
    if index % 4 == 0
      key.key_a + @offset.offset_a
    elsif index % 4 == 1
      key.key_b + @offset.offset_b
    elsif index % 4 == 2
      key.key_c + @offset.offset_c
    elsif index % 4 == 3
      key.key_d + @offset.offset_d
    end
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
