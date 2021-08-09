require "date"

class Shift

  attr_reader :key,
              :date

  def initialize(key, date)
    @key = key
    @date = date
  end

  def key_offset_total_value_pairs
    key_offset_pairs = offset_numbers(date_format_int).zip(split_up_key(key))
    key_offset_pairs.map do |key_offset|
      key_offset.sum
    end
  end

  def offset_numbers(date_format_int)
    num = date_format_int ** 2
    num.to_s.split("")[-4..-1].map { |num| num.to_i }
  end

  def date_format_int
    @date.class == String ? @date.to_i : @date.strftime("%d%m%y").to_i
  end

  def split_up_key(key)
    split_number = key.split("")
    keys = []
    index = 0
    split_number.each do |num|
      keys << (num.concat(split_number[index + 1])).to_i
      index += 1
      break if keys.length == 4
    end
    keys
  end

end
