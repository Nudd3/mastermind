# frozen_string_literal: false

# Class for when the human is the guesser
class HumanGuesser
  def guess(guess_number)
    print "Guess ##{guess_number}: "
    gets.chomp
  end
end
