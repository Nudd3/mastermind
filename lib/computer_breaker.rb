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
    @codes = create_set
    # play
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
    # 4.times.map { rand(1..6) }
    current_guess = [1, 1, 2, 2]
    current_clues = find_clues(@code, current_guess)
    current_guess = current_clues
  end

  def create_set
    (1111..6666).reject do |nr|
      nr.to_s.split(//).map(&:to_i).any? { |v| v > 6 || v < 1 }
    end
  end
end

# Donald Knuth
# 1. Create the set S of 1296 possible codes, 1111 -> 6666
# 2. Start with initial guess 1122
# 3. Play the guess to get clues
# 4. If the clues are 4 correct -> Game over
# 5. Otherwise, remove from S any code that would not give the same response
#    if it (the guess) were the code
# 6.
