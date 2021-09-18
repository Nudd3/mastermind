# frozen_string_literal: false

# class for computer solving
class ComputerSolver
  def computer_start
    @maker = generate_code
  end

  def generate_code
    input = gets.chomp until input.match(/^[1-6]{4}$/)
    input
  end
end
