# frozen_string_literal: false

require_relative 'display'

# Module containing the welcome/introduction message for the game
module Messages
  include Display

  # rubocop:disable Metrics
  def introduction_message
    "
  Welcome to Mastermind! In this version a human will play versus
  the computer to see who's the better code breaker/maker.

  Mastermind is a code breaking game where one player will choose a
  code consisting of 4 colored pegs, and the other player has 12
  guesses to figure out the code. There are a total of 6 different
  peg colors. After each guess, the breaker will be given clues, based
  on the latest guess.


  There are two types of clues:

  1. #{display_clue('?')} If a peg is the correct color
  2. #{display_clue('*')} If a peg is the correct color and in the correct position


  These are the 6 different pegs:

  #{display_peg(1)} #{display_peg(2)} #{display_peg(3)} #{display_peg(4)} #{display_peg(5)} #{display_peg(6)}


  A quick example!

  Let's say that the correct code is the following:

  #{display_peg(2)} #{display_peg(3)} #{display_peg(2)} #{display_peg(6)}

  And the guess is:

  #{display_peg(2)} #{display_peg(2)} #{display_peg(6)} #{display_peg(4)}

  That would result in the following clues: #{display_clue('*')} #{display_clue('?')} #{display_clue('?')}

  The #{display_clue('*')}is because of the #{display_peg(2)} being in the correct position and color
  The two #{display_clue('?')}because the second #{display_peg(2)} and the #{display_peg(6)}

  Note: Each peg can only generate one clue

  Now, let's begin!
    "
  end
  # rubocop:enable Metrics

  def mode_selection_message
    '
  What role would you like to have:
  1. Code breaker
  2. Code maker (not working atm)
  => '
  end

  def mode_selection_error_message
    '
  Please choose role(1/2):
  => '
  end

  def guess_message(guesses)
    "
  #{guesses} guesses remaining
  Make guess:
  => "
  end

  def code_creator_message
    "
  Create your code
  => "
  end

  def input_error_message(role)
    {
      'breaker' => "\nInvalid guess! A guess has to consist of 4 numbers between 1 and 6",
      'maker' => "\nInvalid code! A code has to consist of 4 numbers between 1 and 6"
    }[role]
  end

  def computer_wins_message(role)
    {
      'breaker' => "\n  The computer figured it out! Too bad...\n",
      'maker' => "\n  Ouch! Mr computer are good at making codes!\n  Here's the code:\n"
    }[role]
  end

  def human_wins_message(role)
    {
      'breaker' => "\nCongratulations! You figuered it out!\n",
      'maker' => "\nSmarter than a computer huh? Congratulations!\n\n"
    }[role]
  end

  def computer_code_creater_message
    print "\n  "
    4.times do
      print '. '
      sleep 0.7
    end
    print " ==> Code created!\n"
  end
end
