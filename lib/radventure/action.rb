# frozen_string_literal: true

module Radventure
  # Represents an ingame possible action
  #
  # @!attribute [r] name
  #   @return [String] The general name of the action
  # @!attribute [r] skill
  #   @return [String] The name of the skill to test of the action
  # @!attribute [r] dc
  #   @return [Integer] The the skill's Difficulty Class of the action
  # @!attribute [r] success
  #   @return [String] The success text of the action
  # @!attribute [r] failure
  #   @return [String] The failure text of the action
  # @!attribute [r] status
  #   @return [Boolean, nil] The current status of the action of the action
  class Action
    attr_reader :name, :skill, :success, :failure, :status

    # Action constructor.
    #
    # @param name [String] The general name of the action
    # @param skill [String] The name of the skill to test of the action
    # @param dc [Integer] The skill's Difficulty Class of the action
    # @param success [String] The success text of the action
    # @param failure [String] The failure text of the action
    # @return [Action] The Action object
    def initialize(name, skill, dc, success, failure)
      @name         = name.strip
      @skill        = skill.strip
      @dc           = dc.to_i
      @success      = success.strip
      @failure      = failure.strip
      @status       = nil
    end

    # Try to roll for this action.
    #
    # @param roll [Integer] The result of the roll
    # @return [Boolean] Whether the check succeeded or not
    def try(roll)
      @status = roll.to_i >= @success if @status.nil?

      @status
    end
  end
end
