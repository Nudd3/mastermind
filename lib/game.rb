# frozen_string_literal: false

require_relative 'intro_message'

class Game
  include IntroMessage
  def initialize
    intro_message
    # @maker = choose_role
  end

  def choose_role; end
end
