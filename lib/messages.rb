# frozen_string_literal: false

require_relative 'text_decoration'
# Module containing messages
module Messages
  include TextDecoration
  def start_up_message
    print "\n"
    puts underline('Time to play!')
    puts 'Choose your role:'
    puts '1 - MAKER'
    puts '2 - BREAKER'
    print "\n"
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
end
