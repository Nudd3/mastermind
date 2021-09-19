# frozen_string_literal: false

require_relative 'intro_message'
require_relative 'messages'

# class where everything is put together
class Game
  include IntroMessage
  include Messages
  def play
    intro_message
    role = choose_role
    player_maker if role == '1'
    player_breaker if role == '2'
  end

  private

  def choose_role
    role_choosing_message
    input = gets.chomp
    until input.match(/^[1-2]$/)
      role_choosing_message
      input = gets.chomp
    end
  end

  def player_maker
  
    maker = ComputerSolver.new
    maker.play
  end

  def player_breaker
    breaker = PlayerSolver.new
    breaker.play
  end
end

# rubocop:disable Style/BlockComments

=begin
  1. Choose BREAKER or MAKER
  2. Generate code
      a) player = MAKER, show the player/print the code to the terminal
         - let the computer play until it breaks the code or loses
           print the guess with clues for each guess
           - print win/lose-message to terminal
             - play again?

      b) player = BREAKER
         - let the player play until he/she breaks the code or loses
           print the guess with clues for each guess
           - print win/lose-message to terminal
             - play again?
=end

# rubocop:enable Style/BlockComments
