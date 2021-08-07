require "./lib/enigma"

excrypted_file, decrypted_file, key, date=ARGV

enigma = Enigma.new

encrypted_text = open(encrypted_file, "r") { |file| file.read }

result = enigma.decrypt(encrypted_text, key, date)

decrypter = open(decrypted_file, "w")
decrypter.write(result[:decryption])

puts "Created '#{decrypted_file}' with the key #{result[:key]}, date #{result[:date]}"
<<<<<<< HEAD
s
=======
>>>>>>> 852b37d1a8a1fb75ef6e4e658da2128bf30140f8
