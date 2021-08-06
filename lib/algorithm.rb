require_relative "./key_makable"
require_relative "./alphabetable"
require_relative "./offset"

class Algorithm

  include KeyMakable
  include Alphabetable

  attr_reader :message,
              :key,
              :date,
              :offset,
              :characters

  def initialize(message, key, date)
    @message = message.downcase
    @key = key
    @date = date
    @offset = Offset.new
    @characters = alphabet_counter
  end

  def split_msg(message)
    @message = message.split("")
  end

  # def random_key
  #   if @key ||= @key
  #     @key
  #   else
  #     @key = digits_generator
  #   end
  # end

  def shift(msg_letter_index)
    shift_index = 0
    @message.each do |letter|
      if letter[msg_letter_index] % 4 == 0
        shift_index = key_a + @offset.offset_a
      elsif letter[msg_letter_index] % 4 == 1
        shift_index = key_b + @offset.offset_b
      elsif letter[msg_letter_index] % 4 == 2
        shift_index = key_c + @offset.offset_c
      elsif letter[msg_letter_index] % 4 == 3
        shift_index = key_d + @offset.offset_d
      end
    end
    shift_index
  end

  def rotation
    rotation = []
    final_index_shift = 0
    @message.each_with_index do |letter, letter_index|
      @characters.each do |key, value_index| # hash
        final_index_shift = (letter[letter_index] + shift(letter_index)) % @characters.length
        if final_index_shift == value_index
          rotation << key
        end
      end
    end
    rotation
    require "pry"; binding.pry
    # arr.map { |num| num += shift(arr.index(num)) }
  end
end