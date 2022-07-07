# frozen_string_literal: false

# Class representing the board
class Board
  # The board should have 4 pegs
  # Pegs will be represented as numbers 1-6
  # and displayed as a colored rectangle
  # with the number centered within

  # The board will be a hash with each guess being placed inside
  def initialize
    @board = {}
    @guesses = 0
    create_code
  end

  def create_code; end

  def add_guess; end

  def calculate_clues; end
end

# Each guess can only generate one clue
