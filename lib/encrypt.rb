require "./lib/enigma"

message, encrypted_file=ARGV

enigma = Enigma.new

message_text = open("./lib/message.txt", "r") { |file| file.read }

result = enigma.encrypt(message_text)

encrypter = open("./lib/encrypted.txt", "w")
encrypter.write(result[:encryption])

puts "Created '#{encrypted_file}' with the key #{result[:key]}, date #{result[:date]}"
