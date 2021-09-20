# frozen_string_literal: false

require_relative 'messages'
require_relative 'game_logic'
require_relative 'intro_message'

# class for when player is the breaker
class PlayerSolver
  include GameLogic
  include Messages
  include IntroMessage

  def initialize
    @code = generate_code
  end

  def player_guess
    puts @code # Here for testing purposes, delete later
    turn_ctr = 1
    while turn_ctr <= 12
      user_guess = make_guess(turn_ctr)
      guess_info(user_guess)
      break if winner?(user_guess) != false

      turn_ctr += 1
    end
    computer_won_message if turn_ctr == 13
  end

  private

  def generate_code
    pw = ''
    4.times { pw += rand(1..6).to_s }
    pw
  end

  def guess_info(guess)
    clues = compare(guess, @code)
    print_guess(guess)
    print_clues(clues['*'], clues['?'])
  end

  def winner?(guess)
    guess == @code ? player_won_message : false
  end

  def make_guess(number)
    guess_message(number)
    input = gets.chomp
    until input.match(/^[1-6]{4}$/)
      guess_message(number)
      input = gets.chomp
    end
    input
  end
end
