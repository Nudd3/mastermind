# frozen_string_literal: false

# Module containing the introduction message describing what Mastermind is
# as well as how it's played
module IntroMessage
  def intro_message
    puts <<-INTRO

      Welcome to Mastermind!

      This game is played human vs computer where the
      human first chooses whether to be the one creating
      or breaking the code.

      A code is created by 4 numbers 1-6 connected to a color:

              #{code_colors('1')}#{code_colors('2')}#{code_colors('3')}#{code_colors('4')}#{code_colors('5')}#{code_colors('6')}


      The braker then has 12 guesses to break the code
      After each guess the breaker gets two different notations,
      one that indicates that a number is correct but in the wrong
      spot, and one that indicates that a number is both correct
      and at the correct spot.

      To give an example:

      Let's say the code is 1234, that be

              #{code_colors('1')}#{code_colors('2')}#{code_colors('3')}#{code_colors('4')}

    INTRO

    #color_instructions
  end

  def code_colors(number)
    {
      '1' => "\e[101m  1  \e[0m ",
      '2' => "\e[43m  2  \e[0m ",
      '3' => "\e[44m  3  \e[0m ",
      '4' => "\e[45m  4  \e[0m ",
      '5' => "\e[46m  5  \e[0m ",
      '6' => "\e[41m  6  \e[0m "
    }[number]
  end
end

intro_message