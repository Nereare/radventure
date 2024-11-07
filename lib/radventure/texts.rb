# frozen_string_literal: true

require 'io/console'
require 'rainbow'

module Radventure
  # Method for generic text functionalities
  class Texts
    # Outputs a simple intro to the game.
    # @param meta [Hash] A hash containing the game metadata
    # @return [void]
    def self.intro(meta)
      puts Rainbow("## #{meta.title} ##").yellow.bright
      puts "Version #{meta.version}"
      puts "© #{meta.year}, #{meta.author}"
      puts "Available under #{meta.license}"
      puts ''
      puts meta.description
      wait_for_key
      clear
    end

    # Outputs a simple intro to the game.
    # @param meta [Hash] A hash containing the game metadata
    # @return [void]
    def self.prelude(meta)
      return unless meta.prelude != ''

      puts meta.prelude
      wait_for_key
      clear
    end

    def self.header
      y, x = $stdout.winsize
      puts Rainbow("+#{'=' * (x - 2)}+").italic

      i = 0
      until i == (y - 2)
        puts '+'
        i += 1
      end
    end

    # Prints a "press any key" message and waits for, well, any key.
    # @return [void]
    def self.wait_for_key
      puts ''
      puts Rainbow('<Press any key>').color(:dimgray)
      gets
    end

    # Clears the console screen.
    # @return [void]
    def self.clear
      $stdout.clear_screen
    end
  end
end
