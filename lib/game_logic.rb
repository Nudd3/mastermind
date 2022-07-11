# frozen_string_literal: false

# Module for guess controls
module GameLogic
  def find_clues(code, guess)
    @code_clone = code.clone
    @guess_clone = guess.clone
    @exacts = exacts
    @colors = color
    {
      1 => @exacts,
      2 => @colors
    }
  end

  def exacts
    exacts = 0
    @code_clone.each_with_index do |v, i|
      next unless v == @guess_clone[i]

      exacts += 1
      @code_clone[i] = '*'
      @guess_clone[i] = '*'
    end
    exacts
  end

  def color
    color = 0
    @code_clone.each_with_index do |v, i|
      @guess_clone.each_with_index do |e, j|
        next if e.is_a?(String) || i == j

        next unless v == e

        color += 1
        @code_clone[i] = '?'
        @guess_clone[j] = '?'
      end
    end
    color
  end
end

include GameLogic

a = [1, 2, 1, 1]
b = [1, 1, 1, 5]
puts find_clues(a, b)
