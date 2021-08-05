require "simplecov"
SimpleCov.start

require "date"
require "./lib/offset"

RSpec.describe Offset do
  context "States" do
    offset = Offset.new

    it "exists" do
    expect(offset).to be_a(Offset)
   end
  end

  context "Methods" do
    offset = Offset.new

    it "can format and convert date into integer" do
      expect(offset.date).to eq(50821)
    end

    it "can calculate square numberic form and return last four" do
      expect(offset.last_four).to eq(4041)
    end

    it "can get A off set" do
      expect(offset.offset_a).to eq(1)
    end

    it "can get B off set" do
      expect(offset.offset_b).to eq(0)
    end

    it "can get C off set" do
      expect(offset.offset_c).to eq(2)
    end

    it "can get D off set" do
      expect(offset.offset_d).to eq(5)
    end
  end
end
