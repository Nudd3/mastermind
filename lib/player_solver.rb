# frozen_string_literal: false

require_relative 'messages'
require_relative 'game_logic'

# class for when player is the breaker
class PlayerSolver
  include GameLogic
  include Messages

  def player_start
    @maker = generate_code
    player_guess
  end

  private

  def generate_code
    pw = ''
    4.times { pw += rand(1..6).to_s }
    pw
  end

  def player_guess
    puts @maker
    ctr = 1

    while ctr <= 12
      user_guess = guess(ctr)
      guess_info(user_guess)
      break if winner?(user_guess) != false

      # Print clues!
      ctr += 1
    end
    computer_won_message if ctr == 12
  end

  def guess_info(guess)
    clues = compare(guess, @maker)
    print_guess(guess)
    print_clues(clues['*'], clues['?'])
  end

  def winner?(guess)
    guess == @maker ? player_won_message : false
  end

  def guess(number)
    print "Guess number #{number} (1-6): "
    input = gets.chomp
    until input.match(/^[1-6]{4}$/)
      print "Guess number #{number} (1-6): "
      input = gets.chomp
    end
    input
  end
end

p = PlayerSolver.new
p.player_start
