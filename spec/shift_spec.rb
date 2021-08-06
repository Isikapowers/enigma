require "simplecov"
SimpleCov.start

require "date"
require "./lib/shift"

RSpec.describe Shift do
  context "States" do
    shift = Shift.new("04039", "041290")

    it "exists and has attributes" do
      expect(shift).to be_a(Shift)
      expect(shift.random_number).to eq("04039")
      expect(shift.date).to eq("041290")
    end
  end

  context "Methods" do
    shift = Shift.new("04039", "241296")

    it "can get key from random number" do
      expect(shift.keys("04039")).to eq([04, 40, 03, 39])
    end

    it "can format date into numbers" do
      expect(shift.date_format).to eq(241296)
    end

    it "can get offset numbers" do
      expect(shift.offset_numbers(241296)).to eq([9, 6, 1, 6])
      #58,223,759,616
    end

    it "can calculate shift values for each position(A, B, C, D)" do
      expect(shift.shift_values).to eq([13, 46, 4, 45])
    end
  end
end
