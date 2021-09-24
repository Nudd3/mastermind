# frozen_string_literal: false

require_relative 'messages'
# class for computer solving
class ComputerSolver
  include Messages
  def initialize
    @code = generate_code
  end

  def computer_guess
    @maker = generate_code
  end

  def generate_code
    puts player_create_code
    input = gets.chomp
    input = gets.chomp until input.match(/^[1-6]{4}$/)
  end
end
