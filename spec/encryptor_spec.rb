require "simplecov"
SimpleCov.start

require "date"
require "./lib/offset"
require "./lib/algorithm"
require "./lib/encryptor"
require "./lib/key_makable"
require "./lib/alphabetable"

RSpec.describe Encryptor do
   context "States" do
     encrypt = Encryptor.new("hello world", "02715", "040895")

     it "exists and has attributes" do
       expect(encrypt).to be_a(Encryptor)
       expect(encrypt.message).to eq("hello world")
       expect(encrypt.key).to eq("02715")
       expect(encrypt.date).to eq("040895")

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
       expect(encrypt.characters).to eq(expected)
     end
   end

   context "Methods" do
     encrypt = Encryptor.new("hello world", "02715", "040895")

     it "can split a message into chars" do
       expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]

       expect(encrypt.split_msg("hello world")).to eq(expected)
     end

     it "can get key" do
       expect(encrypt.key).to eq("02715")
     end

     xit "can shift index based on letter index" do
       expect(encrypt.shift(0)).to eq(3)
     end
   end

   # context "#random key" do
   #   encrypt = Encryptor.new("hello world", "040895")
   #
   #   xit "can get random key if key is not provided" do
   #     allow(encrypt).to receive(:digits_generator).and_return(23924)
   #
   #     expect(encrypt.random_key).to eq(23924)
   #   end
   # end

     # it "can find index of char" do
     #   expect(encrypt.find_character).to eq()
     # end

   context "KeyMakable Module" do
     encrypt = Encryptor.new("hello world", "02715", "040895")

     it "can generate random 5 digit key" do
       expect(encrypt.digits_generator).to be_between(00000, 99999)
     end

     it "can generate 5 digit key with leading 0" do
       allow(encrypt).to receive(:digits_generator).and_return(924)

       expect(encrypt.key_string).to eq("00924")
     end

     it "can split up digits into groups of 2" do
       allow(encrypt).to receive(:digits_generator).and_return(23924)

       expect(encrypt.split_up).to eq([23, 39, 92, 24])
     end
   end
end
