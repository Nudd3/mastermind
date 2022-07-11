# frozen_string_literal: false

# Class representing when the human is the breaker
class HumanBreaker
  # include GameLogic

  def initialize
    create_code
    play
  end

  private

  def create_code
    @code = 4.times.map { rand(1..6) }
  end

  def play
    # gets.chomp.split(//).map(&:to_i)
  end
end
