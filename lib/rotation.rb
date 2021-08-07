require_relative "./shift"

class Rotation

  attr_reader :message,
              :key,
              :date,
              :characters

  def initialize(message, key, date)
    @message = message.downcase
    @key = key
    @date = date
    @characters = ("a".."z").to_a << " "
  end

  def split_msg(message)
    @message = message.split("")
  end

  def rotate_forwards(message, shift_amounts)
    encoded_message = split_msg(message).map.with_index do |character, index|
      letter_conversion(character, index, shift_amounts, 1)
    end
    encoded_message.join
  end

  def rotate_backwards(message, shift_amounts)
    encoded_message = split_msg(message).map.with_index do |character, index|
      letter_conversion(character, index, shift_amounts, -1)
    end
    encoded_message.join
  end

  def letter_conversion(character, index, shift_amounts, direction)
    if character_index = @characters.index(character)
      shift_index = index % (shift_amounts.length)
      rotated_alphabet = @characters.rotate(direction * shift_amounts[shift_index])
      rotated_alphabet[character_index]
    else
      character
    end
  end

end
