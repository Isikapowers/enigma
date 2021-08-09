require "date"
require "./lib/enigma"

encrypted_file, decrypted_file, key, date=ARGV

enigma = Enigma.new

encrypted_message = open(ARGV[0], "r") { |file| file.read }

result = enigma.decrypt(encrypted_message, key, date)

decrypter = open(ARGV[1], "w")
  decrypter.write(result[:decryption])
  decrypter.close

puts "Created '#{ARGV[1]}' with the key #{result[:key]} and date #{result[:date]}"
