require "date"
# require_relative "shift"
# require_relative "rotation"
# require_relative "num_generator"

class Enigma

  def date_converter(date)
    if date.class == Time
      date.strftime("%d%m%y")
    else
      date
    end
  end

  def encrypt(message, key=NumGenerator.new.randomizer, date=Time.new)
    shift_amounts = Shift.new(key, date).shift_values
    rotator = Rotation.new(message, key, date)

    encrypted_msg =
          {
          encryption: rotator.rotate_forwards(message, shift_amounts),
          key: key,
          date: date_converter(date)
          }
  end

  def decrypt(message, key, date=Time.new)
    shift_amounts = Shift.new(key, date).shift_values
    rotator = Rotation.new(message, key, date)

    decrypted_msg =
          {
          decryption: rotator.rotate_backwards(message, shift_amounts),
          key: key,
          date: date_converter(date)
          }
  end

end
