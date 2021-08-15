# frozen_string_literal: false

# Module for text messages
class Messages
  def intro_message
    puts <<-INTRO

      Welcome to Mastermind!

      This game is played human vs computer where the
      human first chooses whether to be the one creating
      or breaking the code.

      It then goes on for 12 turns or until the code is
      broken.

      A code is created by 4 numbers 1-6 connected to a color:

    INTRO

    color_instructions
  end

  def color_instructions
    print '  1  '.bg_red + ' '
    print '  2  '.bg_green + ' '
    print '  3  '.bg_blue + ' '
    print '  4  '.bg_brown + ' '
    print '  5  '.bg_gray + ' '
    puts '  6  '.bg_black
  end
end

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

m = Messages.new

m.intro_message
