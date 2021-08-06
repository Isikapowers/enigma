# Add a command line interface for encryption and decryption.
# You should create a Runner file called encrypt.rb that takes
# two command line arguments. The first is an existing file
 # that contains a message to encrypt. The second is a file
  # where your program should write the encrypted message.
  # In addition to writing the encrypted message to the file,
  # your program should output to the screen the file it wrote to,
   # the key and the date.

require "simplecov"
SimpleCov.start

require "./lib/enigma"

message, encrypted_file=ARGV

enigma = Enigma.new

message_text = open(message, "r") { |file| file.read }

result = enigma.encrypt(message_text)

encrypter = open(encrypted_file, "w")
  encrypter.write(result[:encryption])

puts "Created '#{encrypted_file}' with the key #{result[:key]}, date #{result[:date]}"
