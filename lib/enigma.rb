require "date"
require_relative "shift"
require_relative "rotation"
require_relative "key_generator"

class Enigma

  include KeyGenerator

  def encrypt(message, key=random_key_generator, date=Time.new)
    final_shifts = Shift.new(key, date).key_offset_total_value_pairs
    rotator = Rotation.new(message)

    encrypted_msg =
        {
          encryption: rotator.rotate_forwards(message, final_shifts),
          key: key,
          date: date_converter(date)
        }
  end

  def decrypt(message, key, date=Time.new)
    final_shifts = Shift.new(key, date).key_offset_total_value_pairs
    rotator = Rotation.new(message)

    decrypted_msg =
        {
          decryption: rotator.rotate_backwards(message, final_shifts),
          key: key,
          date: date_converter(date)
        }
  end

  def date_converter(date)
    date.class == String ? date : date.strftime("%d%m%y")
  end

end
