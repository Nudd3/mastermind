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

  private

  def create_code
    loop do
      print code_creator_message
      input = gets.chomp.split(//).map(&:to_i)

      return input if input_valid?(input)

      print input_error_message('maker')
    end
  end

  def play
    until @guesses.zero?
      guess = computer_guess
      display_turn(@code, guess)
      break if winner?(@code, guess)

      @guesses -= 1
      sleep 0.5
    end
    find_winner
  end

  def computer_guess
    4.times.map { rand(1..6) }
  end

  def find_winner
    puts @guesses.zero? ? human_wins_message('maker') : computer_wins_message('breaker')
  end
end
