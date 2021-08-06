require "simplecov"
SimpleCov.start

require "date"
require "./lib/algorithm"

RSpec.describe Algorithm do
  context "States" do
    algorithm = Algorithm.new("hello world", "02715", "040895")

    it "exists and has attributes" do
      expect(algorithm).to be_a(Algorithm)
      expect(algorithm.message).to eq("hello world")
      expect(algorithm.key).to eq("02715")
      expect(algorithm.date).to eq("040895")
    end
  end
end
