# frozen_string_literal: true

require 'require_all'
require_all 'lib'

# The main module for the `radventure` repository/package
module Radventure
  # Main class to run the game
  class Game
    @meta = nil
    @current_room = nil
    @main_quest = nil

    # Constructor method.
    # @return [Game] Game execution
    def initialize
      @meta = Meta.new('game.yml')
      Texts.clear
      Texts.intro(@meta)
      Texts.prelude(@meta)
      Texts.header
    end
  end
end
