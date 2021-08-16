# frozen_string_literal: false



# Class for when the computer creates the code
class ComputerCreator
  attr_reader :code

  def initialize
    #@code = generate_code
    @code = 1234
  end

  def generate_code
    code = []
    4.times do
      # code << Peg.new(rand(1..6))
      code << rand(1..6)
    end
    code
  end
end

comp = ComputerCreator.new
comp.generate_code
