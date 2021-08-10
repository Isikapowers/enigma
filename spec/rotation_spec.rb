require "simplecov"
SimpleCov.start

require "date"
require "./lib/rotation"
require "./lib/shift"

RSpec.describe Rotation do
  context "States" do
    rotation = Rotation.new("hello world")

    it "exists and has attributes" do
      expect(rotation).to be_a(Rotation)
      expect(rotation.message).to eq("hello world")

      expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                  "j", "k", "l", "m", "n", "o", "p", "q", "r",
                  "s", "t", "u", "v", "w", "x", "y", "z", " "]

      expect(rotation.characters).to eq(expected)
    end
  end

  context "Methods" do
    rotation = Rotation.new("hello world")
    rotation2 = Rotation.new("GOODBYE world")

    final_shifts = Shift.new("02715", "040895").key_offset_total_value_pairs

    it "can calculate final shifts from date and year" do
      expect(final_shifts).to eq([3, 27, 73, 20])
    end

    it "can handle upper case and split up message" do
      expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]

      expect(rotation.split_message("hEllo woRld")).to eq(expected)

      expected = ["g", "o", "o", "d", "b", "y", "e", " ", "w", "o", "r", "l", "d"]

      expect(rotation2.split_message("GOODBYE world")).to eq(expected)
    end

    it "can rotate forwards for encryption" do
      expected = "keder ohulw"

      expect(rotation.forwards("hello world", final_shifts)).to eq(expected)
    end

    it "can rotate backwards for decryption" do
      expected = "hello world"

      expect(rotation.backwards("keder ohulw", final_shifts)).to eq(expected)
    end

    it "can convert letters using index forwards" do
      expect(rotation.letter_conversion("h", 8, final_shifts, 1)).to eq("k")
    end

    it "can convert letters using index backwards" do
      expect(rotation.letter_conversion("h", 8, final_shifts, -1)).to eq("e")
    end
  end

  context "Edge Cases" do
    rotation = Rotation.new("hello world!")
    rotation2 = Rotation.new("GOODBYE world?")

    final_shifts = Shift.new("02715", "040895").key_offset_total_value_pairs

    it "can calculate final shifts from date and year" do
      expect(final_shifts).to eq([3, 27, 73, 20])
    end

    it "can return special character unconverted" do
      expect(rotation.letter_conversion("!", 8, final_shifts, 1)).to eq("!")
      expect(rotation.letter_conversion("!", 8, final_shifts, -1)).to eq("!")

      expected = "keder ohulw!"

      expect(rotation.forwards("hello world!", final_shifts)).to eq(expected)

      expected = "hello world!"

      expect(rotation.backwards("keder ohulw!", final_shifts)).to eq(expected)
    end

    it "can return special character unconverted" do
      expect(rotation2.letter_conversion("?", 8, final_shifts, 1)).to eq("?")
      expect(rotation2.letter_conversion("?", 8, final_shifts, -1)).to eq("?")

      expected = "keder ohulw?"

      expect(rotation2.forwards("hello world?", final_shifts)).to eq(expected)

      expected = "hello world?"

      expect(rotation2.backwards("keder ohulw?", final_shifts)).to eq(expected)
    end
  end

end
