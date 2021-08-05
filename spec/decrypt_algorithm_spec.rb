require "simplecov"
SimpleCov.start

require "date"
require "./lib/offset"
require "./lib/key"
require "./lib/decrypt_algorithm"

RSpec.describe DecryptAlgorithm do
   context "States" do
     decrypt = DecryptAlgorithm.new("keder ohulw", "02715", "040895")

     it "exists and has attributes" do
       expect(decrypt).to be_a(DecryptAlgorithm)
       expect(decrypt.message).to eq("keder ohulw")
       expect(decrypt.key).to eq("02715")
       expect(decrypt.date).to eq("040895")
       expect(decrypt.characters).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
     end
   end

   context "Methods" do
     decrypt = DecryptAlgorithm.new("keder ohulw", "02715", "040895")

     it "can split a message into chars" do
       expected = ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"]

       expect(decrypt.split_msg("keder ohulw")).to eq(expected)
     end

     it "can get key" do
       expect(decrypt.key).to eq("02715")
     end

     xit "can find index of char" do
       expect(decrypt.find_character).to eq()
     end

     xit "can shift char" do
       expect(encrypt.shift(1)).to eq()
     end
   end
end
