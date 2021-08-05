require "simplecov"
SimpleCov.start

require "date"
require "./lib/enigma"

RSpec.describe Enigma do
  context "States" do
    enigma = Enigma.new

    it "exists and has attributes" do
      expect(enigma).to be_a(Enigma)
    end
  end

  context "Methods" do
    enigma = Enigma.new

    it "can encrypt a message with key and date" do
      expected = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                  }
      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
    end
  end
end
