module KeyGenerator

  def random_key_generator
    numbers = [*0..9]
    generated_number = numbers.sample(5).join
  end

end
