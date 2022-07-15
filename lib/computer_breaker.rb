# frozen_string_literal: false

# Class for when computer is breaking the code
class ComputerBreaker
  def initialize
    @guesses = 12
    create_code
    play
  end

  def create_code
    2.times do
      print "
  Create your code
  =>
  "
      input = gets.chomp.split(//).map(&:to_i)
      # break if code_valid?(input)
      break if input_valid?(input)
    end
  end

  def play; end

  def solve; end
end
