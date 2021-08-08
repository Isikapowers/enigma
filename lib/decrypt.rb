require "./lib/enigma"

encrypted_file, decrypted_file, key, date=ARGV

enigma = Enigma.new

encrypted_text = open(ARGV[0], "r") { |file| file.read }

result = enigma.decrypt(encrypted_text, key, date)

decrypter = open(ARGV[1], "w")
  decrypter.write(result[:decryption])

puts "Created '#{ARGV[1]}' with the key #{result[:key]}, date #{result[:date]}"
