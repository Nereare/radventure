# frozen_string_literal: true

module Radventure
  # Represents an ingame furniture item
  class Furniture
    attr_reader :name, :view, :desc

    # Furniture constructor.
    #
    # @param name [String] The name of the furniture item
    # @param view [String] The initial description of the furniture item
    # @param desc [String] The long description of the furniture item
    # @return [Furniture] The Furniture item object
    def initialize(name, view, desc)
      @name = name.strip
      @view = view.strip
      @desc = desc.strip
    end
  end
end
