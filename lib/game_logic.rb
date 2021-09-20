# frozen_string_literal: false

require_relative 'text_decoration'

# Module for the logic of the game
module GameLogic
  include TextDecoration
  def compare(guess, master)
    guess_copy = guess.clone
    master_copy = master.clone
    guess_copy = guess_copy.split(//)
    master_copy = master_copy.split(//)

    correct_position = fully_correct(guess_copy, master_copy)
    correct_number = half_correct(guess_copy, master_copy)
    {
      '*' => correct_position,
      '?' => correct_number
    }
  end

  def fully_correct(guess, master)
    counter = 0
    master.each_with_index do |value, index|
      next unless value == guess[index]

      counter += 1
      guess[index] = '*'
      master[index] = '*'
    end
    counter
  end

  def half_correct(guess, master)
    counter = 0

    guess.each_index do |index|
      next unless guess[index] != '*' && master.include?(guess[index])

      counter += 1
      to_change = master.find_index(guess[index])
      master[to_change] = '?'
      guess[index] = '?'
    end
    counter
  end

  def solved?(guess, master)
    guess == master
  end
end
