# frozen_string_literal: true

module Radventure
  # Represents and ingame money cache
  #
  # @!attribute [r] platinum
  #   @return [Integer] The amount of platinum for this money cache
  # @!attribute [r] gold
  #   @return [Integer] The amount of gold for this money cache
  # @!attribute [r] silver
  #   @return [Integer] The amount of silver for this money cache
  # @!attribute [r] copper
  #   @return [Integer] The amount of copper for this money cache
  class Money
    attr_reader :platinum, :gold, :silver, :copper

    # Constructor method.
    #
    # @param platinum [Integer] The amount of platinum for this money cache
    # @param gold [Integer] The amount of gold for this money cache
    # @param silver [Integer] The amount of silver for this money cache
    # @param copper [Integer] The amount of copper for this money cache
    # @returns [Money] Money object
    def initialize(platinum, gold, silver, copper)
      @platinum = platinum.to_i
      @gold = gold.to_i
      @silver = silver.to_i
      @copper = copper.to_i
    end
  end
end
