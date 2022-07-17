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
      puts "New size: #{@set.size}"
      @guesses -= 1
      sleep 0.5
    end
    puts "End set: #{@set}"
    find_winner
  end

  def find_winner
    puts @guesses.zero? ? human_wins_message('maker') : computer_wins_message('breaker')
  end

  # Below here is where the Donald Knuth algorithm will be applied
  def computer_guess
    # 4.times.map { rand(1..6) }
    current_guess = [1, 1, 2, 2]
    current_guess if @guesses == 12

    @set[5].to_s.split(//).map(&:to_i)
    # now to remove all from set that doesn't give the same clues
    # maybe that should be done in a method being called from #play
  end

  def remove_from_set(current_guess)
    clues = find_clues(@code, current_guess)
    @set.each do |code|
      temp = code.to_s.split(//).map(&:to_i)
      @set.delete(code) unless find_clues(current_guess, temp) == clues
    end
  end

  def create_set
    (1111..6666).reject do |nr|
      nr.to_s.split(//).map(&:to_i).any? { |v| v > 6 || v < 1 }
    end
  end
end

# Donald Knuth
# 5. Otherwise, remove from S any code that would not give the same response
#    if it (the guess) were the code
# 6.
