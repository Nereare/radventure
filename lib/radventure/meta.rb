# frozen_string_literal: true

require 'yaml'

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

    # Constructor method.
    #
    # @param yaml_file [String] The path to the game's metadata YAML file
    # @returns [Meta] Game metadata object
    def initialize(yaml_file)
      meta = fetch yaml_file
      @title = meta['title']
      @description = meta['description']
      @version = meta['version']
      @author = meta['author']
      @license = meta['license']
      @year = meta['year'].to_s
      @prelude = meta['prelude'] || ''
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
          'title' => 'Foo',
          'description' => 'Lorem ipsum.',
          'version' => '0.1.0',
          'author' => 'No One',
          'license' => 'WTFPL'
        }
      end
    end
  end
end
