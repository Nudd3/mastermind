# frozen_string_literal: false

# peg class
class Peg
  def initialize(value)
    @value = value
    @color = set_color(value)
  end
end

def get_color(value)
  case value
  when 1 then 'red'
  when 2 then 'orange'
  when 3 then 'blue'
  when 4 then 'yellow'
  when 5 then 'white'
  when 6 then 'black'
  end
end

# Master code: 4 digit code with numbers between 1-6
# Number/color combinations:
# 1: red
# 2: orange
# 3: blue
# 4: yellow
# 5: white
# 6: black
