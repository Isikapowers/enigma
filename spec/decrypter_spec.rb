require "simplecov"
SimpleCov.start

require "date"
require "./lib/offset"
require "./lib/algorithm"
require "./lib/decrypter"
require "./lib/key_makable"
require "./lib/alphabetable"

RSpec.describe Decrypter do
   context "States" do
     decrypt = Decrypter.new("keder ohulw", "02715", "040895")

     it "exists and has attributes" do
       expect(decrypt).to be_a(Decrypter)
       expect(decrypt.message).to eq("keder ohulw")
       expect(decrypt.key).to eq("02715")
       expect(decrypt.date).to eq("040895")
       # expect(decrypt.characters).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
       expected = { "a" => 1,
                    "b" => 2,
                    "c" => 3,
                    "d" => 4,
                    "e" => 5,
                    "f" => 6,
                    "g" => 7,
                    "h" => 8,
                    "i" => 9,
                    "j" => 10,
                    "k" => 11,
                    "l" => 12,
                    "m" => 13,
                    "n" => 14,
                    "o" => 15,
                    "p" => 16,
                    "q" => 17,
                    "r" => 18,
                    "s" => 19,
                    "t" => 20,
                    "u" => 21,
                    "v" => 22,
                    "w" => 23,
                    "x" => 24,
                    "y" => 25,
                    "z" => 26,
                    " " => 27 }
       expect(decrypt.characters).to eq(expected)
     end
   end

   context "Methods" do
     decrypt = Decrypter.new("keder ohulw", "02715", "040895")

     xit "can split a message into chars" do
       expected = ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"]

       expect(decrypt.split_msg("keder ohulw")).to eq(expected)
     end

     xit "can get key" do
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
