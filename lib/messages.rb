# frozen_string_literal: false

# Module containing messages
module Messages
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
