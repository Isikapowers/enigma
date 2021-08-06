module Alphabetable

  def alphabet_counter
    alphabet_hash = {}
    alphabets = ("a".."z").to_a << " "
    counter = 1

    alphabets.each do |char|
      alphabet_hash[char] = counter
      counter += 1
    end
    alphabet_hash
  end

end
