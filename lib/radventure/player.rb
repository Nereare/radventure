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
      @first_name = create_first_name
      @last_name  = create_last_name
      @nickname   = create_nickname
      @age        = create_age
      @gender     = create_gender
      @race       = create_race
      @class      = create_class
      @level      = level.to_i
      end_creation
    end

    # Returns the full name of the player character
    #
    # @return [String] The full name of the character
    def full_name
      r = @first_name
      r += " (#{@nickname})" unless @nickname.empty?
      r += " #{@last_name}" unless @last_name.empty?
      r
    end

    # Returns a full (albeit short) description of the player character
    #
    # @return [String] A full (albeit short) description of the character
    def greeting_card
      "#{full_name}, #{age}yo #{gender} #{race}, #{@class} #{level}"
    end

    private

    # Outputs an introductory message
    #
    # @return [void]
    def start_creation
      puts Rainbow('## Char Creation ##').blue.bright
      puts 'Let\'s begin your character creation, now.'
      puts ''
    end

    # Outputs a finishing message
    #
    # @return [void]
    def end_creation
      puts "Character #{Rainbow(greeting_card).blue.bright} created!"
      wait_for_key
      clear
    end

    # Retrieves the first name of the character
    #
    # @return [String] The first name of the character
    def create_first_name
      puts "#{Rainbow('1.').green} First Name:"
      print '> '
      gets.strip
    end

    # Retrieves the last name of the character
    #
    # @return [String] The last name of the character
    def create_last_name
      puts "#{Rainbow('2.').green} Last Name:"
      print '> '
      gets.strip
    end

    # Retrieves the nickname of the character
    #
    # @return [String] The nickname of the character
    def create_nickname
      puts "#{Rainbow('3.').green} Nickname:"
      print '> '
      gets.strip
    end

    # Retrieves the age of the character
    #
    # @return [Integer] The age of the character
    def create_age
      puts "#{Rainbow('4.').green} Age (in years):"
      print '> '
      gets.to_i
    end

    # Retrieves the gender of the character
    #
    # @return [String] The gender of the character
    def create_gender
      puts "#{Rainbow('5.').green} Gender:"
      puts "  #{Rainbow('5.1.').green} Female (1);"
      puts "  #{Rainbow('5.2.').green} Male (2);"
      puts "  #{Rainbow('5.3.').green} Gender Fluid (3);"
      puts "  #{Rainbow('5.4.').green} Non-Binary (4); or"
      puts "  #{Rainbow('5.5.').green} Other... (5)"
      print '#> '
      r = gets.to_i
      case r
      when 1
        'Female'
      when 2
        'Male'
      when 3
        'Gender Fluid'
      when 4
        'Non-Binary'
      else
        puts "#{Rainbow('5.again.').green} Enter the name of your gender:"
        print '> '
        gets.strip
      end
    end

    # Retrieves the race of the character
    #
    # @return [String] The race of the character
    def create_race
      puts "#{Rainbow('6.').green} Choose the race:"
      puts "  #{Rainbow('6.1.').green} Aarakocra (1);"
      puts "  #{Rainbow('6.2.').green} Aasimar (2);"
      puts "  #{Rainbow('6.3.').green} Dragonborn (3);"
      puts "  #{Rainbow('6.4.').green} Dwarf (4);"
      puts "  #{Rainbow('6.5.').green} Elf (5);"
      puts "  #{Rainbow('6.6.').green} Air Genasi (6);"
      puts "  #{Rainbow('6.7.').green} Earth Genasi (7);"
      puts "  #{Rainbow('6.8.').green} Fire Genasi (8);"
      puts "  #{Rainbow('6.9.').green} Water Genasi (9);"
      puts "  #{Rainbow('6.10.').green} Gnome (10);"
      puts "  #{Rainbow('6.11.').green} Goliath (11);"
      puts "  #{Rainbow('6.12.').green} Half-Elf (12);"
      puts "  #{Rainbow('6.13.').green} Half-Orc (13);"
      puts "  #{Rainbow('6.14.').green} Halfling (14);"
      puts "  #{Rainbow('6.15.').green} Human (15);"
      puts "  #{Rainbow('6.16.').green} Tabaxi (16);"
      puts "  #{Rainbow('6.17.').green} Tiefling (17); or"
      puts "  #{Rainbow('6.18.').green} Other... (18)"
      print '#> '
      r = gets.to_i
      case r
      when 1
        'Aarakocra'
      when 2
        'Aasimar'
      when 3
        'Dragonborn'
      when 4
        'Dwarf'
      when 5
        'Elf'
      when 6
        'Air Genasi'
      when 7
        'Earth Genasi'
      when 8
        'Fire Genasi'
      when 9
        'Water Genasi'
      when 10
        'Gnome'
      when 11
        'Goliath'
      when 12
        'Half-Elf'
      when 13
        'Half-Orc'
      when 14
        'Halfling'
      when 15
        'Human'
      when 16
        'Tabaxi'
      when 17
        'Tiefling'
      else
        puts "#{Rainbow('6.again.').green} Enter the name of your race:"
        print '> '
        gets.strip
      end
    end

    # Retrieves the class of the character
    #
    # @return [String] The class of the character
    def create_class
      puts "#{Rainbow('7.').green} Choose the class:"
      puts "  #{Rainbow('7.1.').green} Artificer (1);"
      puts "  #{Rainbow('7.2.').green} Barbarian (2);"
      puts "  #{Rainbow('7.3.').green} Bard (3);"
      puts "  #{Rainbow('7.4.').green} Cleric (4);"
      puts "  #{Rainbow('7.5.').green} Druid (5);"
      puts "  #{Rainbow('7.6.').green} Fighter (6);"
      puts "  #{Rainbow('7.7.').green} Monk (7);"
      puts "  #{Rainbow('7.8.').green} Paladin (8);"
      puts "  #{Rainbow('7.9.').green} Ranger (9);"
      puts "  #{Rainbow('7.10.').green} Rogue (10);"
      puts "  #{Rainbow('7.11.').green} Sorcerer (11);"
      puts "  #{Rainbow('7.12.').green} Warlock (12); or"
      puts "  #{Rainbow('7.13.').green} Wizard (13)."
      print '#> '
      r = gets.to_i
      case r
      when 1
        'Artificer'
      when 2
        'Barbarian'
      when 3
        'Bard'
      when 4
        'Cleric'
      when 5
        'Druid'
      when 6
        'Fighter'
      when 7
        'Monk'
      when 8
        'Paladin'
      when 9
        'Ranger'
      when 10
        'Rogue'
      when 11
        'Sorcerer'
      when 12
        'Warlock'
      else
        'Wizard'
      end
    end

    # Prints a "press any key" message and waits for, well, any key
    #
    # @return [void]
    def wait_for_key
      puts ''
      puts Rainbow('<Press any key>').color(:dimgray)
      gets
    end

    # Clears the console screen
    #
    # @return [void]
    def clear
      $stdout.clear_screen
    end
  end
end
