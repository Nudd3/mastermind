# frozen_string_literal: false

require_relative 'intro_message'

# class where everything is put together
class Game
  include IntroMessage
  def play; end

  def choose_role; end

  def player_maker; end

  def player_breaker; end
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
