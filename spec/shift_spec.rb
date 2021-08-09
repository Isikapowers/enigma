require "simplecov"
SimpleCov.start

require "date"
require "./lib/shift"

RSpec.describe Shift do
  context "States" do
    shift = Shift.new("04039", "041290")

    it "exists and has attributes" do
      expect(shift).to be_a(Shift)
      expect(shift.key).to eq("04039")
      expect(shift.date).to eq("041290")
    end
  end

  context "Methods" do
    shift = Shift.new("04039", "241296")

    it "can get split up key into 4 groups fo 2 digits" do
      expect(shift.split_up_key("04039")).to eq([04, 40, 03, 39])
    end

    it "can get split up key into 4 groups fo 2 digits" do
      expect(shift.split_up_key("00352")).to eq([00, 03, 35, 52])
    end

    it "can get split up key into 4 groups fo 2 digits" do
      expect(shift.split_up_key("12345")).to eq([12, 23, 34, 45])
    end

    it "can format date into numbers" do
      expect(shift.date_format_int).to eq(241296)
    end

    it "can format date into numbers" do
      allow(shift).to receive(:date_format_int).and_return(Time.new.strftime("%d%m%y"))

      expect(shift.date_format_int).to eq(Time.new.strftime("%d%m%y"))
    end

    it "can get offset numbers" do
      expect(shift.offset_numbers(241296)).to eq([9, 6, 1, 6])
    end

    it "can calculate shift values for each position(A, B, C, D)" do
      expect(shift.key_offset_total_value_pairs).to eq([13, 46, 4, 45])
    end
  end

end
