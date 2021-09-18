# frozen_string_literal: false

# module containing methods to decorate strings
module TextDecoration
  def color_code(number)
    {
      '1' => "\e[41m  1  \e[0m ", # red
      '2' => "\e[42m  2  \e[0m ", # green
      '3' => "\e[43m  3  \e[0m ", # yellow
      '4' => "\e[44m  4  \e[0m ", # blue
      '5' => "\e[45m  5  \e[0m ", # magenta
      '6' => "\e[46m  6  \e[0m "  # cyan
    }[number]
  end

  def clue_code(symbol)
    {
      '*' => "\e[31m *\e[0m ", # red star
      '?' => "\e[37m *\e[0m " # white star
    }[symbol]
  end

  def underline(text)
    "\e[4m#{text}\e[24m"
  end
  
  def print_clues(correct, half_correct)
    correct.times { print clue_code('*') }
    half_correct.times { print clue_code('?') }
    puts ''
  end
end