require "simplecov"
SimpleCov.start

require "date"
require "./lib/key"

RSpec.describe Key do
  context "States" do
    key = Key.new

    it "exists" do
      expect(key).to be_a(Key)
    end
  end

  context "Methods" do
    key = Key.new

    it "can get random 5 numbers for key" do
      allow(Key).to receive(:random_num).and_return("02715")
      expect(key.random_num).to eq("02715".to_i)
    end

    xit "can split up nums into 2 digit group" do
      expect(key.split_up).to eq([02, 27, 71, 15])
    end

    xit "can get individual key" do
      expect(key.key_a).to eq(02)
      expect(key.key_b).to eq(27)
      expect(key.key_c).to eq(71)
      expect(key.key_d).to eq(15)
    end
  end
end
