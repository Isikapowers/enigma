class Shift

  attr_reader :random_number,
              :date

  def initialize(random_number, date=Time.new)
    @random_number = random_number
    @date = date
  end

  def keys(random_number)
    split_number = random_number.split("")
    keys = []
    index = 0
    split_number.each do |num|
      keys << (num + split_number[index + 1]).to_i
      index += 1
      break if keys.length == 4
    end
    keys
  end

<<<<<<< HEAD
  def date_formats
=======
  def date_format
>>>>>>> 852b37d1a8a1fb75ef6e4e658da2128bf30140f8
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
    numbers = offset_numbers(date_format).zip(keys(random_number))
    #pry(#<Shift>)> numbers => [[9, 4], [6, 40], [1, 3], [6, 39]]
    numbers.map do |arr|
      arr.sum
    end
  end
end
