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

end
