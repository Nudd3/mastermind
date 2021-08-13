# frozen_string_literal: false

require_relative 'peg'

# Class for when player creates the code
class PlayerCreator
  def initialize
    @code = generate_code
  end

  def generate_code
    print 'Enter a 4 digit code (1-6): '
    user_input = gets.chomp.split('').map(&:to_i)
    user_input.each_index do |i|
      user_input[i] = Peg.new(user_input[i])
    end
  end

  def display
    @code.each do |peg|
      print "#{peg} "
    end
    print "\n"
  end
end

p = PlayerCreator.new
p.display
