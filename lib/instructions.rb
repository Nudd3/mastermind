# frozen_string_literal: false

# rubocop:disable Metrics/AbcSize

# instructions
module Instructions
  def instructions
    puts <<~HEREDOC

      #{formatting('red', 'How to play Mastermind:')}      
      ASDH

    HEREDOC
  end

  def formatting(description, string)
    {
      'underline' => "\e[4;1m#{string}\e[0m",
      'red' => "\e[31;1m#{string}\e[0m"
    }[description]
  end
end

# TRY
class Test
  include Instructions

  def print
    instructions
  end
end

t = Test.new
t.print
