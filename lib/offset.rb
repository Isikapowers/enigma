require "date"

class Offset

  attr_reader :date

  def initialize(date = (Time.now.strftime("%d%m%y").to_i))
    @date = date
  end

#   The offsets are found using the date of transmission.
#
# Consider the date formatted as a number, DDMMYY.
# If the date is August 4, 1995, it would be
 # represented as 040895.
# Square the numeric form (1672401025)
# Take the last four digits (1025)
# A offset: The first digit (1)
# B offset: The second digit (0)
# C offset: The third digit (2)
# D offset: The fourth digit (5)

  def last_four
    square_date = @date ** 2
    square_date.to_s.split("")[-4..-1].map { |num| num.to_i }
  end

  def offset_a
    last_four[0]
  end

  def offset_b
    last_four[1]
  end

  def offset_c
    last_four[2]
  end

  def offset_d
    last_four[3]
  end

end
