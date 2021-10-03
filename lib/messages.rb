# frozen_string_literal: false

require_relative 'text_decoration'
# Module containing messages
module Messages
  include TextDecoration
  def role_choosing_message
    print "\n"
    puts 'Choose your role:'
    puts '1 - MAKER'
    puts '2 - BREAKER'
    print "\n"
  end

  def player_create_code
    puts 'You are the MAKER'
    puts 'Please enter the code'
  end

  def player_won_message
    print "\n"
    puts 'Congrats to the player! The computer stood no chance!'
    print "\n"
  end

  def computer_won_message
    print "\n"
    puts 'Unfortunately the computer won this time...'
    print "\n"
  end

  def guess_message(number)
    puts "Guess number #{number} (1-6): "
  end

  def last_guess_message
    puts 'This is your last guess!'
  end

  def print_clues(correct, half_correct)
    print 'Clues: '
    correct.times { print clue_code('*') }
    half_correct.times { print clue_code('?') }
    print "\n\n"
  end

  def print_guess(guess)
    print "\n"
    guess.split(//).each do |val|
      print "#{color_code(val)} "
    end
  end
end
