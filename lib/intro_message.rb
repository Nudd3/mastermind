# frozen_string_literal: false

# Module containing the introduction message describing what Mastermind is
# as well as how it's played
module IntroMessage
  def intro_message
    puts <<-INTRO

      #{underline('Welcome to Mastermind!')}

      This game is played human vs computer where the
      human first chooses whether to be the one creating
      or breaking the code.

      A code is created by 4 numbers 1-6, each connected to a color:

              #{color_code('1')}#{color_code('2')}#{color_code('3')}#{color_code('4')}#{color_code('5')}#{color_code('6')}


      The braker then has 12 guesses to break the code
      After each guess the breaker gets two different notations,
      one that indicates that a number is correct but in the wrong
      spot, and one that indicates that a number is both correct
      and at the correct spot.

      To give an example:

      Let's say the code is 1412, that would result in it looking like so:

              #{color_code('1')}#{color_code('4')}#{color_code('1')}#{color_code('2')}

    INTRO
  end

  def color_code(number)
    {
      # '1' => "\e[40m  1  \e[0m ", # black
      '1' => "\e[41m  1  \e[0m ", # red
      '2' => "\e[42m  2  \e[0m ", # green
      '3' => "\e[43m  3  \e[0m ", # yellow
      '4' => "\e[44m  4  \e[0m ", # blue
      '5' => "\e[45m  5  \e[0m ", # magenta
      '6' => "\e[46m  6  \e[0m ", # cyan
      # '8' => "\e[47m  1  \e[0m "  # white
    }[number]
  end

  def underline(text)
    "\e[4m#{text}\e[24m"
  end
end
