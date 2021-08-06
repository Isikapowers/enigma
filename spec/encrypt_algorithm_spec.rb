require "simplecov"
SimpleCov.start

require "date"
require "./lib/offset"
require "./lib/key"
require "./lib/encrypt_algorithm"
require "./lib/key_makable"
require "./lib/alphabetable"

RSpec.describe EncryptAlgorithm do
   context "States" do
     encrypt = EncryptAlgorithm.new("hello world", "02715", "040895")

     it "exists and has attributes" do
       expect(encrypt).to be_a(EncryptAlgorithm)
       expect(encrypt.message).to eq("hello world")
       expect(encrypt.key).to eq("02715")
       expect(encrypt.date).to eq("040895")
       expect(encrypt.characters).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
     end
   end

   context "Methods" do
     encrypt = EncryptAlgorithm.new("hello world", "02715", "040895")

     it "can split a message into chars" do
       expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]

       expect(encrypt.split_msg("hello world")).to eq(expected)
     end

     it "can get key" do
       expect(encrypt.key).to eq("02715")
     end

     xit "can find index of char" do
       expect(encrypt.find_character).to eq()
     end

     xit "can shift char" do
       expect(encrypt.shift(1)).to eq()
     end
   end
end
