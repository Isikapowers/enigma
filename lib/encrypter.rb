require "date"
require_relative "./key_makable"
require_relative "./alphabetable"
require_relative "./offset"
require_relative "./rotation"

class Encrypter

#   def random_key
#     if @key ||= @key
#       @key
#     else
#       @key = digits_generator
#     end
#   end
#
  # def final_shifts
  #   final_shifts_hash = {}
  #   letters = a..d
  #   letters.each do |letter|
  #     final_shifts_hash[letter] = key_a + @offset.offset_a
  #     final_shifts_hash[letter] = key_b + @offset.offset_b

  def encrypted_msg
    rotation.join
    # encrypted_msg.map { |num| @characters.index(num) }
  end

end
