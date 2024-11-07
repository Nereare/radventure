# frozen_string_literal: true

require_relative 'radventure/meta'
require_relative 'radventure/texts'

module Radventure
  # Main class to run the game
  class Game
    @meta = nil
    @current_room = nil
    @main_quest = nil

    # Constructor method.
    # @returns [Game] Game execution
    def initialize
      @meta = Meta.new('game.yml')
      Texts.clear
      Texts.intro(@meta)
      Texts.prelude(@meta)
      Texts.header
    end
  end
end
