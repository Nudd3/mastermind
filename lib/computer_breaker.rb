# frozen_string_literal: false

require_relative 'display'
require_relative 'messages'
require_relative 'game_logic'

# Class for when computer is breaking the code
class ComputerBreaker
  include GameLogic
  include Messages
  include Display

  def initialize
    @guesses = 12
    @code = create_code
    play
  end

  def create_code
    loop do
      print "
  Create your code
  =>
  "
      input = gets.chomp.split(//).map(&:to_i)

      return input if input_valid?(input)
    end
  end

  def play
    until @guesses.zero?
      guess = computer_guess
      display_turn(@code, guess)
      break if winner?(@code, guess)

      @guesses -= 1
    end
  end

  def computer_guess
    4.times.map { rand(1..6) }
  end
end
