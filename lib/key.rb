class Key

  attr_reader :key

  def initialize
    @key = random_num
  end

#   The keys are created by generating a random five digit
# number, like 02715, and splitting it up like so:
#
# A key: first two digits (02)
# B key: second and third digits (27)
# C key: third and fourth digits (71)
# D key: fourth and fifth digits (15)
  def random_num
    @key = ""
    5.times { key << rand(0..9).to_s }
      return @key.to_i
  end

  def split_up
    (0..3).map do |num|
      @key.to_s[num, 2].to_i
    end
  end

  def key_a
    split_up[0]
  end

  def key_b
    split_up[1]
  end

  def key_c
    split_up[2]
  end

  def key_d
    split_up[3]
  end

end
