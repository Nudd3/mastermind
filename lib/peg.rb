# frozen_string_literal: false

# puts "\e[31m" # set format (red foreground)
# puts "\e[0m"  # clear format

# peg class
class Peg
  def initialize(value)
    @value = value
    @color = set_color(value)
  end
end

def get_color(value)
  case value
  when 1 then 'red'
  when 2 then 'orange'
  when 3 then 'blue'
  when 4 then 'yellow'
  when 5 then 'white'
  when 6 then 'black'
  end
end

# Master code: 4 digit code with numbers between 1-6
# Number/color combinations:
# 1: red
# 2: orange
# 3: blue
# 4: yellow
# 5: white
# 6: black

puts get_color(1)
puts get_color(2)
puts get_color(3)
puts get_color(4)
puts get_color(5)
puts get_color(6)
x = 'Hello'
puts "\e[30m#{x}\e[0m"

class String
  def black
    "\e[30m#{self}\e[0m"
  end

  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  def brown
    "\e[33m#{self}\e[0m"
  end

  def blue
    "\e[34m#{self}\e[0m"
  end

  def magenta
    "\e[35m#{self}\e[0m"
  end

  def cyan
    "\e[36m#{self}\e[0m"
  end

  def gray
    "\e[37m#{self}\e[0m"
  end

  def bg_black
    "\e[40m#{self}\e[0m"
  end

  def bg_red
    "\e[41m#{self}\e[0m"
  end

  def bg_green
    "\e[42m#{self}\e[0m"
  end

  def bg_brown
    "\e[43m#{self}\e[0m"
  end

  def bg_blue
    "\e[44m#{self}\e[0m"
  end

  def bg_magenta
    "\e[45m#{self}\e[0m"
  end

  def bg_cyan
    "\e[46m#{self}\e[0m"
  end

  def bg_gray
    "\e[47m#{self}\e[0m"
  end

  def bold
    "\e[1m#{self}\e[22m"
  end

  def italic
    "\e[3m#{self}\e[23m"
  end

  def underline
    "\e[4m#{self}\e[24m"
  end

  def blink
    "\e[5m#{self}\e[25m"
  end

  def reverse_color
    "\e[7m#{self}\e[27m"
  end
end

puts "I'm back green".bg_green
puts "I'm red and back cyan".red.bg_cyan
puts "I'm bold and green and backround red".bold.green.bg_red
