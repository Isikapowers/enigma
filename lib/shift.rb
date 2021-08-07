require "date"

class Shift

  attr_reader :key,
              :date

  def initialize(key, date=Time.new)
    @key = key
    @date = date
  end

  def split_up_key(key)
    split_number = key.split("")
    keys = []
    index = 0
    split_number.each do |num|
      keys << (num + split_number[index + 1]).to_i
      index += 1
      break if keys.length == 4
    end
    keys
  end

  def date_format
    if @date.class == Time
      @date.strftime("%d%m%y").to_i
    elsif
      @date.class == String
      @date.to_i
    end
  end

  def offset_numbers(date_format)
    num = date_format ** 2
    num.to_s.split("")[-4..-1].map { |num| num.to_i }
  end

  def shift_values
    numbers = offset_numbers(date_format).zip(split_up_key(key))
    numbers.map do |sub_arr|
      sub_arr.sum
    end
  end

end
