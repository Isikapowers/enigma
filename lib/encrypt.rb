require "./lib/enigma"

enigma = Enigma.new

message = open(ARGV[0], "r") { |file| file.read }

# key = ARGV[2]
#
# date = ARGV[3]

result = enigma.encrypt(message)

encrypter = open(ARGV[1], "w")
  encrypter.write(result[:encryption])
  encrypter.close

puts "Created '#{ARGV[1]}' with the key #{result[:key]} and date #{result[:date]}"
