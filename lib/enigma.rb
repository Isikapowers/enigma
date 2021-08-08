require "date"
require_relative "shift"
require_relative "rotation"
require_relative "key_generator"

class Enigma

  include KeyGenerator

  def encrypt(message, key=random_key_generator, date=Time.new)
    final_shifts = Shift.new(key, date).key_offset_total_value_pairs
    rotator = Rotation.new(message, key, date)

    encrypted_msg =
          {
          encryption: rotator.rotate_forwards(message, final_shifts),
          key: key,
          date: date_converter(date)
          }
  end

  def decrypt(message, key, date=Time.new)
    final_shifts = Shift.new(key, date).key_offset_total_value_pairs
    rotator = Rotation.new(message, key, date)

    decrypted_msg =
          {
          decryption: rotator.rotate_backwards(message, final_shifts),
          key: key,
          date: date_converter(date)
          }
  end

  def date_converter(date)
    if date.class == Time
      date.strftime("%d%m%y")
    else
      date
    end
  end

end
