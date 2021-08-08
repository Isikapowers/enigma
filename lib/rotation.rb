require_relative "shift"
require_relative "key_generator"

class Rotation

  include KeyGenerator

  attr_reader :message,
              :key,
              :date,
              :characters

  def initialize(message, key=random_key_generator, date)
    @message = message.downcase
    @key = key
    @date = date
    @characters = ("a".."z").to_a << " "
  end

  def split_msg(message)
    @message = message.split("")
  end

  def rotate_forwards(message, final_shifts)
    encrypted_message = split_msg(message).map.with_index do |character, index|
      letter_conversion(character, index, final_shifts, 1)
    end
    encrypted_message.join
  end

  def rotate_backwards(message, final_shifts)
    decrypted_message = split_msg(message).map.with_index do |character, index|
      letter_conversion(character, index, final_shifts, -1)
    end
    decrypted_message.join
  end

  def letter_conversion(character, index, final_shifts, direction)
    if character_index = @characters.index(character)
      shift_index = index % (final_shifts.length)
      rotated_alphabet = @characters.rotate(direction * final_shifts[shift_index])
      rotated_alphabet[character_index]
    else
      character
    end
  end

end
