require "simplecov"
SimpleCov.start

require "date"
require "./lib/offset"
require "./lib/key_makable"
require "./lib/alphabetable"

RSpec.describe Offset do
  context "States" do
    offset = Offset.new

    it "exists" do
    expect(offset).to be_a(Offset)
   end
  end

  context "Methods" do
    offset = Offset.new

    it "can format and convert date" do
      allow(offset).to receive(:date).and_return("050821")

      expect(offset.date).to eq("050821")
    end

    it "can calculate square numberic form and return last four" do
      allow(offset).to receive(:date).and_return("050821")

      expect(offset.last_four_digits).to eq([4, 0, 4, 1])
    end

<<<<<<< HEAD
    it "can get A off set" do
      allow(offset).to receive(:date).and_return("050821")

      expect(offset.offset_a).to eq(4)
    end

    it "can get B off set" do
      allow(offset).to receive(:date).and_return("050821")

      expect(offset.offset_b).to eq(0)
    end

    it "can get C off set" do
      allow(offset).to receive(:date).and_return("050821")

      expect(offset.offset_c).to eq(4)
    end

    it "can get D off set" do
      allow(offset).to receive(:date).and_return("050821")

      expect(offset.offset_d).to eq(1)
    end
  end

  context "KeyMakable Module" do
    offset = Offset.new

    it "can generate random 5 digit key" do
      expect(offset.digits_generator).to be_between(00000, 99999)
    end

    it "can generate 5 digit key with leading 0" do
      allow(offset).to receive(:digits_generator).and_return(924)

      expect(offset.key_string).to eq("00924")
    end

    it "can split up digits into groups of 2" do
      allow(offset).to receive(:digits_generator).and_return(23924)

      expect(offset.split_up).to eq([23, 39, 92, 24])
    end
  end

  context "Alphabetable Module" do
    offset = Offset.new

    it "can get a hash of alphabets and their counters" do
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
      expect(offset.alphabet_counter).to eq(expected)
=======
    xit "can get A off set" do
      expect(offset.offset_a).to eq(1)
    end

    xit "can get B off set" do
      expect(offset.offset_b).to eq(0)
    end

    xit "can get C off set" do
      expect(offset.offset_c).to eq(2)
    end

    xit "can get D off set" do
      expect(offset.offset_d).to eq(5)
>>>>>>> 34b4c55b1a5379bf9be29a4296dafcf1b854c285
    end
  end
end
