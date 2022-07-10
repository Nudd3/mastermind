# frozen_string_literal: false

# Modue for the logic
module GameLogic
  def play(part)
    {
      1 => human,
      2 => computer
    }[part]
  end

  def display_guess; end
end
