# frozen_string_literal: true

require 'io/console'
require 'rainbow'

module Radventure
  # Represents the ingame player
  class Player
    attr_reader :first_name, :last_name, :nickname, :age, :gender, :race, :class, :level

    # Constructor method
    #
    # @param level [Integer] The starting level of the player
    # @return [Player] Player object
    def initialize(level)
      start_creation
      @name = create_name
      @level = level.to_i
    end

    private

    # Outputs a introductory message
    #
    # @return [void]
    def start_creation
      puts Rainbow('## Char Creation ##').blue.bright
      puts 'Let\'s begin your character creation, now.'
      puts ''
    end

    # Retrieves the $1 of the character
    #
    # @return [$2] The $1 of the character
    def create_name
      puts "#{Rainbow('1.').green} First Name:"
      print '> '
      gets.strip
    end

    # Clears the console screen
    #
    # @return [void]
    def clear
      $stdout.clear_screen
    end
  end
end
