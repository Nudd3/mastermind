# frozen_string_literal: false

# rubocop:disable Metrics/AbcSize

require_relative './text_decoration'

# Module containing the introduction message describing what Mastermind is
# as well as how it's played
# It also gives a quick example
module IntroMessage
  include TextDecoration

  def intro_message
    puts <<-INTRO

      #{underline('Welcome to Mastermind!')}

      This game is played human vs computer where the
      human first chooses whether to be the 'maker' or
      the 'breaker' of the code.

      A code is created by 4 number/color combinations:

              #{color_code('1')}#{color_code('2')}#{color_code('3')}#{color_code('4')}#{color_code('5')}#{color_code('6')}

      The same number/color can be used more than once.

      The breaker has 12 guesses to find out the correct code.

      #{underline('Clues')}:

      There are two different kinds of clues:

      #{clue_code('*')}: One correct number in the correct position.
      #{clue_code('?')}: One correct number in the wrong position.

      #{underline('An example')}:

      Let's say the code is 1412, that be:

              #{color_code('1')}#{color_code('4')}#{color_code('1')}#{color_code('2')}

      Guess number 1: 1233

      Guess:  #{color_code('1')}#{color_code('2')}#{color_code('3')}#{color_code('3')} Clues: #{clue_code('*')}#{clue_code('?')}

      The clues to the right of the guess now tells you that one
      number is at the correct position (the first '1') and that
      one is correct but at the wrong position (the '2').

                    #{underline('Now lets play Mastermind!')}


    INTRO
  end
end

# rubocop:enable Metrics/AbcSize
