# frozen_string_literal: true

require 'io/console'
require_relative 'radventure/meta'

module Radventure
  # Main class to run the game
  class Game
    # Constructor method
    # @returns [Game] Game execution
    def initialize
      $stdout.clear_screen
      intro
    end

    # Outputs a simple intro to the game
    # @return [void]
    def intro
      puts "< #{Radventure::TITLE} >"
      puts "Version #{Radventure::VERSION}"
      puts "By #{Radventure::AUTHOR}"
      puts ''
      puts Radventure::DESCRIPTION
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
