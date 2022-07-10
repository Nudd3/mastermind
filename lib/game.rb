# frozen_string_literal: false

require_relative 'introduction'

# Class for game
class Game
  include Introduction

  def initialize
    puts message
    sleep 2
    mode = mode_selector
    mode == 1 ? HumanBreaker.new : ComputerBreaker.new
  end

  def mode_selector
    puts 'What role would you like to have: '
    puts '1. Code breaker'
    puts '2. Code maker (not working atm)'
    print ': '
    loop do
      input = gets.chomp

      return input if input.match(/^[1-2]$/)

      print 'Please choose role: '
    end
  end
end

Game.new
