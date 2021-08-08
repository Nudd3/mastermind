# frozen_string_literal: false

# Module for text messages
module Messages
  def intro_message
    puts <<-INTRO

      Welcome to Mastermind!

      This game is played human vs computer where the
      human first chooses whether to be the one creating
      or breaking the code.

      It then goes on for 12 turns or until the code is
      broken.

    INTRO
  end
end
