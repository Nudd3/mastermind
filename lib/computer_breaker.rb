# frozen_string_literal: false

require_relative 'display'
require_relative 'messages'
require_relative 'game_logic'

# Class for when computer is breaking the code
class ComputerBreaker
  include GameLogic
  include Messages
  include Display

  def initialize
    @guesses = 12
    @code = create_code
    @set = create_set
    play
  end

  private

  def create_code
    loop do
      print code_creator_message
      input = gets.chomp.split(//).map(&:to_i)

      return input if input_valid?(input)

      print input_error_message('maker')
    end
  end

  def play
    until @guesses.zero?
      guess = computer_guess
      display_turn(@code, guess)
      break if winner?(@code, guess)

      remove_from_set(guess)
      @guesses -= 1
      sleep 0.5
    end
    find_winner
  end

  def find_winner
    puts @guesses.zero? ? human_wins_message('maker') : computer_wins_message('breaker')
  end

  # Below here is where the Donald Knuth algorithm will be applied
  def computer_guess
    return [1, 1, 2, 2] if @guesses == 12

    @set[rand(0..@set.size - 1)].to_s.split(//).map(&:to_i) # This is just random
  end

  def create_set
    (1111..6666).reject do |nr|
      nr.to_s.split(//).map(&:to_i).any? { |v| v > 6 || v < 1 }
    end
  end

  def remove_from_set(current_guess)
    current_clues = find_clues(@code, current_guess)

    @set.each do |code|
      temp = code.to_s.split(//).map(&:to_i)

      temp_clues = find_clues(current_guess, temp)
      @set.delete(code) unless temp_clues == current_clues
    end
  end
end
