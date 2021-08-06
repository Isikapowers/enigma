module KeyMakable

  def digits_generator
    rand(0..99999)
  end

  def key_string
    "%05d" % digits_generator
  end

  def split_up
    (0..3).map do |num|
      digits_generator.to_s[num, 2].to_i
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
