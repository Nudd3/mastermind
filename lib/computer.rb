# frozen_string_literal: false

# Computer class
class Computer
  # Style/MutableConstant
  COLORS = %w[Blue Red Green Yellow White Black].freeze

  def initialize
    @code = generate_code
  end

  # Array of 4 pegs
  # The code consists of 4 pegs of different color
  # The color is choosen using a number 1-6
  def generate_code
    generate_colors
    generate_order
  end

  def generate_colors
    
  end
end
