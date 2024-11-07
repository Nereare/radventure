# frozen_string_literal: true

require 'io/console'
require_relative 'radventure/meta'

module Radventure
  # Main class to run the game
  class Game
    @meta = nil

    # Constructor method.
    # @returns [Game] Game execution
    def initialize
      @meta = Meta.new('game.yml')
      $stdout.clear_screen
      intro
    end

    # Outputs a simple intro to the game.
    # @return [void]
    def intro
      puts "< #{@meta.title} >"
      puts "Version #{@meta.version}"
      puts "By #{@meta.author}"
      puts ''
      puts @meta.description
      wait_for_key
    end

    # Prints a "press any key" message and waits for, well, any key.
    # @return [void]
    def wait_for_key
      puts ''
      puts '<Press any key>'
      gets
    end
  end
end
