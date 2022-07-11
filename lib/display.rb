# frozen_string_literal: false

require_relative 'game_logic'

# This module contains the different colors used in the game
module Display
  include GameLogic

  def display_peg(number)
    {
      1 => "\e[41m  1  \e[0m",
      2 => "\e[42m  2  \e[0m",
      3 => "\e[43m  3  \e[0m",
      4 => "\e[44m  4  \e[0m",
      5 => "\e[45m  5  \e[0m",
      6 => "\e[46m  6  \e[0m"
    }[number]
  end

  def display_clue(symbol)
    {
      '*' => "\e[31m*\e[0m ", # red star
      '?' => "\e[37m*\e[0m " # white star
    }[symbol]
  end

  def display_turn(code, guess)
    guess.each { |nr| print "#{display_peg(nr)} " }
    puts "\n"

    clues = find_clues(guess, code)
    clues['*'].times { print display_clue('*') }
    clues['?'].times { print display_clue('?') }
    puts "\n"
  end
end

include Display
code = [1,2,3,4]
guess = [4,2,1,3]
print "\nCode: #{code}\n"
print "Guess: #{guess}"

display_turn(code, guess)
