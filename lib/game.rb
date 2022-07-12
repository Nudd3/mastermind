# frozen_string_literal: false

require_relative 'messages'
require_relative 'human_breaker'
require_relative 'computer_breaker'

# Class for game
class Game
  include Messages

  def initialize
    puts introduction_message
    mode = mode_selector
    mode == '1' ? HumanBreaker.new : ComputerBreaker.new
  end

  def mode_selector
    puts mode_selection_message
    loop do
      input = gets.chomp

      return input if input.match?(/^[1-2]$/)

      print mode_selection_error_message
    end
  end
end

Game.new
