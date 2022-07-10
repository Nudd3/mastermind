# frozen_string_literal: false

# Module for guess controls
module GameLogic
  def find_clues(code, guess)
    @code_clone = code.clone
    @guess_clone = guess.clone
  end

  def exacts(code, guess)
    @exacts = 0
    code.each_with_index do |v, i|
      next unless v == guess[i]

      @exacts += 1
      code[i] = '*'
      guess[i] = '*'
    end
    @exacts
  end

  def color(code, guess); end
end

include GameLogic

a = [1, 2, 1, 4]
b = [1, 1, 1, 5]
puts exacts(a, b)
puts
