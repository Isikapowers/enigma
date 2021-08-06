require "date"
require_relative "./key_makable"
require_relative "./alphabetable"

class Offset

  include KeyMakable
  include Alphabetable

  attr_reader :date,
              :key

  def initialize(date = (Time.now.strftime("%d%m%y")))
    @date = date
    @key = key
  end

  def last_four_digits
    square_date = @date.to_i ** 2
    square_date.to_s.split("")[-4..-1].map { |num| num.to_i }
  end

  def offset_a
    last_four_digits[0]
  end

  def offset_b
    last_four_digits[1]
  end

  def offset_c
    last_four_digits[2]
  end

  def offset_d
    last_four_digits[3]
  end

end
