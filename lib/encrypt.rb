require "./lib/enigma"

# message, encrypted_file=ARGV

enigma = Enigma.new

message_text = open(ARGV[0], "r") { |file| file.read }

# key = ARGV[2]
#
# date = ARGV[3]

result = enigma.encrypt(message_text)

encrypter = open(ARGV[1].to_s, "w")
  encrypter.write(result[:encryption])

puts "Created '#{ARGV[1]}' with the key #{result[:key]}, date #{result[:date]}"
