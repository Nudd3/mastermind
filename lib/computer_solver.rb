# frozen_string_literal: false

require_relative 'messages'
require_relative 'game_logic'
require_relative 'intro_message'
# class for computer solving
class ComputerSolver
  include GameLogic
  include Messages
  include IntroMessage
  def initialize
    @code = generate_code
    # print_guess(@code) # Display the code the user created
    @all_codes = create_set_of_codes
  end

  # Create algorithm for when computer is solving!
  def computer_guess
    # Create a set S of 1296 possible codes, 1111 - 6666
    turn_ctr = 1
    while turn_ctr <= 12
      computer_guess = make_guess(turn_ctr)
      winner?(computer_guess)
      guess_info(computer_guess)
      turn_ctr += 1
    end
  end

  def make_guess(number)
    last_guess_message if number == 12
    guess_message(number)
    if number == 1
      "1122"
    else
      g = ''
      4.times { g += rand(1..4).to_s }
      g
    end
  end

  def generate_code
    puts player_create_code
    input = gets.chomp
    input = gets.chomp until input.match(/^[1-6]{4}$/)
    input.to_s
  end

  def create_set_of_codes
    all_codes = []
    start = 1111
    all_codes << start
    until start == 6666
      start += 1
      if start.to_s[3] == '7'
        start += 10
        start -= 6
      elsif start.to_s[2] == '7'
        start += 100
        start -= 60
      elsif start.to_s[1] == '7'
        start += 1000
        start -= 600
      end
      all_codes << start
    end
    all_codes
  end

  def guess_info(guess)
    clues = compare(guess, @code)
    print_guess(guess)
    print_clues(clues['*'], clues['?'])
  end

  def winner?(guess)
    guess == @code ? player_won_message : false
  end
end
