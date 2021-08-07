require "simplecov"
SimpleCov.start

require "date"
require "./lib/enigma"
require "./lib/shift"
require "./lib/rotation"
require "./num_generator"

RSpec.describe Enigma do
  context "States" do
    enigma = Enigma.new

    it "exists and has attributes" do
      expect(enigma).to be_a(Enigma)
    end
  end

  describe "#encrypt" do
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


  describe "#decrypt" do
    enigma = Enigma.new

    it "can decrypt a message with key and date" do
      expected = {
                  decryption: "hello world",
                  key: "02715",
                  date: "040895"
                  }
      expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    end
  end
end
