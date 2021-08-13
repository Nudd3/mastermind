# frozen_string_literal: false

require_relative 'peg'

# Class for when the computer creates the code
class ComputerCreator
  def initialize
    @code = generate_code
  end

  def generate_code
    code = []
    4.times do
      code << Peg.new(rand(1..6))
    end
    code
  end

  def display
    @code.each do |peg|
      puts peg
    end
  end
end

comp = ComputerCreator.new
comp.generate_code
comp.display
