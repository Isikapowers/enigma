require "date"
require_relative "enigma"

enigma = Enigma.new

encrypted_message = open(ARGV[0], "r") { |file| file.read }

key = ARGV[2]

date = ARGV[3]

result = enigma.decrypt(encrypted_message, key, date=Time.new)

decrypter = open(ARGV[1], "w")
  decrypter.write(result[:decryption])
  decrypter.close

puts "Created '#{ARGV[1]}' with the key #{result[:key]} and date #{result[:date]}"
