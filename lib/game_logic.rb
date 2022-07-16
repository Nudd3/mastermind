# frozen_string_literal: false

# Module for guess controls
module GameLogic
  def find_clues(code, guess)
    @code_clone = code.clone
    @guess_clone = guess.clone
    {
      '*' => exact_matches,
      '?' => partial_matches
    }
  end

  def exact_matches
    matches = 0
    @code_clone.each_with_index do |v, i|
      next unless v == @guess_clone[i]

      matches += 1
      @code_clone[i] = '*'
      @guess_clone[i] = '*'
    end
    matches
  end

  def partial_matches
    matches = 0
    @code_clone.each_with_index do |v, i|
      next if v == '*'
      @guess_clone.each_with_index do |e, j|
        next if e == '*' || i == j

        next unless v == e

        matches += 1
        @code_clone[i] = '?'
        v = '?'
        @guess_clone[j] = '?'
        e = '?'
        break
      end
    end
    matches
  end

  def winner?(code, guess)
    guess == code
  end

  def input_valid?(input)
    return false if input.length != 4
    return false unless input.all? { |v| v.between?(1, 6) }

    true
  end
end
