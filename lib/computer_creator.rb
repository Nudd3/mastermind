# frozen_string_literal: false

# Class for when the computer creates the code
class ComputerCreator
  attr_reader :code

  def initialize
    @code = generate_code
  end

  def generate_code
    code = ''
    4.times do
      code += rand(1..6).to_s
    end
    code
  end

  def display_code
    puts @code
  end
end
