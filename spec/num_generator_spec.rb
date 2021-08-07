require "simplecov"
SimpleCov.start

require "date"
require "./lib/num_generator"

RSpec.describe NumGenerator do
  context "States" do
    generator = NumGenerator.new

    it "exists and has attributes" do
      expect(generator).to be_a(NumGenerator)
      expect(generator.numbers).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  context "Methods" do
    generator = NumGenerator.new

    it "can generate random 5 digit numbers" do
      allow(NumGenerator).to receive(:randomizer).and_return("041298")

      expect(generator.randomizer).to eq("041298")
    end
  end
end
