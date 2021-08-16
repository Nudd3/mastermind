# frozen_string_literal: false

require_relative 'computer_creator'
require_relative 'human_guesser'
require_relative './intro_message'
#require_relative 'lib/intro_message'

# Mastermind Game

#
#   12 turns to guess the secret code.
#   6 different colors
#   4 different places
#   One player
#   One computer
#
#   First:
#     1. Computer selects the code, human guesses
#     2. Player guesses
#     3. Computer puts a black peg for correct position
#        and correct color
#        and a white peg for wrong position but correct
#        color
#
class Game
  include IntroMessage
  def setup_game
    intro_message
    #choose_roles
    # generate
  end

  # Choose who's the breaker and the maker
  def choose_roles; end

  # Generate the code
  def generate
    maker = ComputerCreator.new
    guesser = HumanGuesser.new(maker.code)
    guesser.guess
  end
end

game = Game.new
game.setup_game
