# frozen_string_literal: true

require 'io/console'
require_relative 'radventure/meta'

module Radventure
  # Main class to run the game
  class Game
    def initialize
      $stdout.clear_screen
      intro
    end

    def intro
      puts "< #{Radventure::TITLE} >"
      puts "Version #{Radventure::VERSION}"
      puts "By #{Radventure::AUTHOR}"
      puts ''
      puts Radventure::DESCRIPTION
    end
  end
end
