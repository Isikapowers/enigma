class Enigma

  def initialize
    # @encryption =
  end

  def today_date(date=Time.now)
    date.strftime("%d%m%y")
  end  

  def encrypt(message, key, date=today_date)
    encrypted_msg = {}

    { encryption: "",
      key: key,
      date: date }
  end

  def decrypt(message, key, date)
    decrypted_msg = {}

    { decryption: "",
      key: key,
      date: date }
  end

end
