# frozen_string_literal: false

# rubocop:disable Metrics/AbcSize

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
      After each guess the breaker can get two different kinds of clues,
      one that indicates that a number is correct but in the wrong
      spot, and one that indicates that a number is both correct
      and at the correct spot.

      To give an example:
      # Code pegs and key pegs, ONLY ONE CLUE PER PEG
      Let's say the code is 1412, that would mean it is looking like so:

              #{color_code('1')}#{color_code('4')}#{color_code('1')}#{color_code('2')}

      Guess number 1: 1233

      Guess:  #{color_code('1')}#{color_code('2')}#{color_code('3')}#{color_code('3')} Clues: #{clue_code('*')}#{clue_code('?')}

      will give two clues
      will give the clues that you have one peg fully correct(the first '1')
      and one that is the correct color but at the wrong position(the '2').

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
      '6' => "\e[46m  6  \e[0m " # cyan
      # '8' => "\e[47m  1  \e[0m "  # white
    }[number]
  end

  def clue_code(number)
    {
      '*' => "\e[31m *\e[0m ", # 100%
      '?' => "\e[36m *\e[0m " # 50%
    }[number]
  end

  def underline(text)
    "\e[4m#{text}\e[24m"
  end

  def formatting(description, string)
    {
      'underline' => "\e[4;1m#{string}\e[0m",
      'red' => "\e[31;1m#{string}\e[0m"
    }[description]
  end
end

# rubocop:enable Metrics/AbcSize
