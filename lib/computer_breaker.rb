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
    # According to Knuth 1122 is the best guess to begin with
    return [1, 1, 2, 2] if @guesses == 12

    # Create a method that decides which code in the @set to use as the next guess
    @set[rand(0..@set.size)].to_s.split(//).map(&:to_i) # This is just random
  end

  def remove_from_set(current_guess)
    clues = find_clues(@code, current_guess)
    @set.each do |code|
      temp = code.to_s.split(//).map(&:to_i)
      @set.delete(code) unless find_clues(current_guess, temp) == clues
    end
    puts "set size: #{@set.size}"
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
# 6.Apply minimax technique to find a next guess as follows:
# For each possible guess, that is, any unused code of the 1296
# not just those in S, calculate how many possibilities in S
# would be eliminated for each possible colored/white peg score.
# The score of a guess is the minimum number of possibilities it
# might eliminate from S. From the set of guesses with the maximum
# score select one as the next guess, choosing a member of S
# whenever possible. (Knuth follows the convention of choosing
# the guess with the least numeric value e.g. 2345 is lower than 3456.
# Knuth also gives an example showing that in some cases no member
# of S will be among the highest scoring guesses and thus the
# guess cannot win on the next turn yet will be necessary to
# assure a win in five.)
