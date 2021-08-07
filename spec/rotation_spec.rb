require "simplecov"
SimpleCov.start

require "date"
require "./lib/rotation"
require "./lib/shift"

RSpec.describe Rotation do
  context "States" do
    rotation = Rotation.new("hello world", "02715", "040895")

    it "exists and has attributes" do
      expect(rotation).to be_a(Rotation)
      expect(rotation.message).to eq("hello world")
      expect(rotation.key).to eq("02715")
      expect(rotation.date).to eq("040895")

      expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                  "j", "k", "l", "m", "n", "o", "p", "q", "r",
                  "s", "t", "u", "v", "w", "x", "y", "z", " "]

      expect(rotation.characters).to eq(expected)
    end
  end

  context "Methods" do
    rotation = Rotation.new("hello world", "04039", "241296")
    rotation2 = Rotation.new("GOODBYE world", "57329", "180698")

    shift_amounts = Shift.new("02715", "040895").shift_values

    it "exists and has attributes" do
      expect(rotation).to be_a(Rotation)
      expect(rotation.message).to eq("hello world")
      expect(rotation.key).to eq("04039")
      expect(rotation.date).to eq("241296")
    end

    it "can handle upper case input" do
      expect(rotation2.message).to eq("goodbye world")
      expect(rotation2.key).to eq("57329")
      expect(rotation2.date).to eq("180698")
    end

    it "can split up message" do
      expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]

      expect(rotation.split_msg("hello world")).to eq(expected)
    end

    it "can rotate forwards for encryption" do
      expected = "uxpcas fddh"

      expect(rotation.rotate_forwards("hello world", [13, 46, 4, 45])).to eq(expected)
    end

    it "can rotate backwards for decryption" do
      expected = "hello world"

      expect(rotation.rotate_backwards("uxpcas fddh", [13, 46, 4, 45])).to eq(expected)
    end

    it "can convert letters using index forwards" do
      expect(rotation.letter_conversion("h", 8, [13, 46, 4, 45], 1)).to eq("u")
    end

    it "can convert letters using index backwards" do
      expect(rotation.letter_conversion("h", 8, [13, 46, 4, 45], -1)).to eq("v")
    end
  end
  
end
