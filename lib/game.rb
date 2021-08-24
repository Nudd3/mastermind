# frozen_string_literal: false

require_relative 'computer_creator'
require_relative 'human_guesser'
require_relative 'intro_message'
require_relative 'text_decoration'

require 'pry-byebug'
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
  include TextDecoration

  def initialize
    @maker = ComputerCreator.new
    @code = @maker.code
    @breaker = HumanGuesser.new
  end

  def setup_game
    intro_message
    # choose_roles
    @maker.display_code
    play
  end

  # Choose who's the breaker and the maker
  def choose_roles
    puts 'Choose your role: '
    puts '1: Maker'
    puts '2: Breaker'
    print '-: '
    gets.chomp
  end

  def play
    guess_counter = 1
    until guess_counter > 12
      guess = @breaker.guess(guess_counter)
      print_guess(guess)
      print_clues(clue_generator(@maker.code, guess))
      print "\n"
      if guess == @code
        puts 'HELLO!'
        return
      end
      guess_counter += 1
    end
    puts 'You lost!'
  end

  def print_guess(guess)
    guess.split(//).each do |val|
      print "#{color_code(val)} "
    end
  end

  def print_clues(clues_hash)
    #number.to_i.times { print clue_code('*').to_s }
    clues_hash['*'].times { print clue_code('*') }
    clues_hash['?'].times { print clue_code('?') }
  end

  
  def clue_generator(master, guess)
    clues = {
      '*' => 0, # This one always works
      '?' => 0 # Why isn't this working! Check the else statement
    }
    #binding.pry
    # Need to save indices checked
    saved_indices = []

    # Finding the 100% correct ones
    # This one is working as intended
    (0..3).each do |i|
      clues['*'] += 1 if guess[i] == master[i]
      saved_indices << i
    end

    (0..3).each do |i| 
      (0..3).each do |j|
        if guess[i] == master[j]
          if i != j && !saved_indices.include?(i)
            clues['?'] += 1
            continue
          end
        end
      end
    end
    # Finding the ones with the wrong position
    clues
  end
end
