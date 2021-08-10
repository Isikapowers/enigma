class Rotation

  attr_reader :message,
              :characters

  def initialize(message)
    @message = message
    @characters = ("a".."z").to_a << " "
  end

  def split_message(message)
    @message = message.downcase.split("")
  end

  def forwards(message, final_shifts)
    encrypted_message = split_message(message).map.with_index do |character, index|
      letter_conversion(character, index, final_shifts, 1)
    end
    encrypted_message.join
  end

  def backwards(message, final_shifts)
    decrypted_message = split_message(message).map.with_index do |character, index|
      letter_conversion(character, index, final_shifts, -1)
    end
    decrypted_message.join
  end

  def letter_conversion(character, index, final_shifts, direction)
    if character_index = @characters.index(character)
      shift_index = index % (final_shifts.length)
      rotated_characters = @characters.rotate(direction * final_shifts[shift_index])
      rotated_characters[character_index]
    else
      character
    end
  end

end
