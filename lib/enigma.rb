require "date"

class Enigma

  def date_converter(date)
    if date.class == Time
      date.strftime("%d%m%y")
    else
      date
    end
  end

  def encrypt(message, key=Generator.new.random, date=Time.new)
    encrypted_msg = {}

    shift_amounts = Shift.new(key, date).shift_values
    encrypted_msg[:encryption] = Rotator.new.rotate_forwards(message, shift_amounts)
    encrypted_msg[key:] = key
    encrypted_msg[:date] = date_converter(data)

    encrypted_msg
  end

  def decrypt(message, key, date=Time.new)
    decrypted_msg = {}

    shift_amounts = Shift.new(key, date).shift_values
    decrypted_msg[:decryption] = Rotator.new.rotate_backwards(message, shift_amounts)
    decrypted_msg[key:] = key
    decrypted_msg[:date] = date_converter(data)

    decrypted_msg
  end

end
