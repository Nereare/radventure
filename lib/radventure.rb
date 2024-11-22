# frozen_string_literal: true

require 'require_all'
require_all 'lib'

# The main module for the `radventure` repository/package
module Radventure
  # Main class to run the game
  class Game
    @meta = nil
    @current_room = nil
    @status = nil
    @player = nil

    # Constructor method.
    # @return [Game] Game execution
    def initialize(meta, player_level, initial_room)
      # `meta` **MUST** be an instance of Meta
      raise 'meta must be an instance of Meta' unless meta.instance_of? Radventure::Meta
      # `initial_room` **MUST** be an instance of Room
      raise 'initial_room must be an instance of Room' unless initial_room.instance_of? Radventure::Room

      # Get game data
      @meta = meta
      @current_room = initial_room
      @status = :explore

      # Show initial info
      Texts.clear
      Texts.intro(@meta)
      Texts.prelude(@meta)

      # Create Player object
      @player = Radventure::Player.new(player_level)

      # Begins game loop
      loop do
        case @status
        when :explore
          Texts.show_room(@current_room)
        end
        cmd = gets.strip
      end
    end
  end
end
