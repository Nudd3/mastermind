# frozen_string_literal: false

# Class for when the human is the guesser
class HumanGuesser
  def initialize(code)
    @code = code
  end

  def guess
    print 'Make your guess: '
    guess = gets.chomp.to_i
    until guess == @code
      print 'Make your guess: '
      guess = gets.chomp.to_i
      puts 'GENIUS' if guess == @code
    end
  end
end
