# frozen_string_literal: true

module Radventure
  # Defines game metadata
  #
  # @!attribute [r] title
  #   @return [String] The name/title of the game
  # @!attribute [r] description
  #   @return [String] The short description of the game
  # @!attribute [r] version
  #   @return [String] The version of the game
  # @!attribute [r] author
  #   @return [String] The author name of the game
  # @!attribute [r] license
  #   @return [String] The license name of the game
  # @!attribute [r] year
  #   @return [String] The year/years of development/release of the game
  # @!attribute [r] prelude
  #   @return [String, nil] A text block containg the game's prelude, or `nil` if none is set
  #
  # @example Initialize metadata
  #   meta = Meta.new 'game.yml'
  class Meta
    attr_reader :title, :description, :version, :author, :license, :year, :prelude

    # Constructor method
    #
    # @param title [String] The title of the game
    # @param description [String] The description of the game
    # @param version [String] The version of the game, in accordance with SemVer
    # @param author [String] The author of the game
    # @param license [String] The license of the game
    # @param year [String, Integer] The year(s) of the game
    # @param prelude [String] The prelude text of the game
    # @return [Meta] Game metadata object
    def initialize(title, description, version, author, license, year, prelude: '')
      @title = title.strip
      @description = description.strip
      @version = version.strip
      @author = author.strip
      @license = license.strip
      @year = year.to_s.strip
      @prelude = prelude.strip || ''
    end

    private

    # Retrieves the metadata from the game's YAML file
    #
    # @param yaml_file [String] The path to the game's metadata YAML file
    # @return [Hash] A hash containing the game metadata
    def fetch(yaml_file)
      if File.exist? yaml_file
        YAML.load_file yaml_file
      else
        {
          'title' => 'No Title',
          'description' => 'No description so far.',
          'version' => 'x.y.z',
          'author' => 'No One',
          'license' => 'CC0',
          'year' => '1917'
        }
      end
    end
  end
end
