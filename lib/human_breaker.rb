# frozen_string_literal: false

require_relative 'display'
require_relative 'messages'
require_relative 'game_logic'

# Class representing when the human is the breaker
class HumanBreaker
  include GameLogic
  include Messages
  include GameLogic

  def initialize
    @guesses = 12
    create_code
    play
  end

  private

  def create_code
    computer_code_creater_message
    @code = 4.times.map { rand(1..6) }
  end

  def play
    until @guesses.zero?
      guess = make_guess
      display_turn(@code, guess)
      break if winner?(@code, guess)

      @guesses -= 1
    end
    find_winner
  end

  def make_guess
    loop do
      print guess_message(@guesses)
      input = gets.chomp.split(//).map(&:to_i)

      # return input if guess_valid?(input)
      return input if input_valid?(input)

      print guess_error_message
    end
  end

  def find_winner
    if @guesses.zero?
      puts computer_wins_message
      display_code(@code)
    else
      puts human_wins_message
    end
  end
end
