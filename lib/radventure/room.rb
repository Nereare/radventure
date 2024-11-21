# frozen_string_literal: true

module Radventure
  class Room
    attr_reader :is_lit, :items
    attr_accessor :north, :northeast, :east, :southeast, :south, :southwest, :west, :northwest,
                  :up, :down, :inside, :outside

    # Constructor method
    #
    # @param name [String] The name of the room
    # @param description [String] The description of the room
    # @param is_lit [Boolean] Whether or not the room has light, defaults to `true`
    # @return [Room] Room object
    def initialize(name, description, is_lit: true)
      @name        = name.strip
      @description = description.strip
      @is_lit      = is_lit ? true : false
      @items       = []
    end

    # The name of the room
    #
    # @return [String] The name of the room
    def name(darkvision: false)
      if @is_lit || darkvision
        @name
      else
        'Darkness'
      end
    end

    # The description of the room
    #
    # @return [String] The description of the room
    def description(darkvision: false)
      if @is_lit || darkvision
        @description
      else
        'The room is in total darkness and you cannot see a thing.'
      end
    end
  end
end
