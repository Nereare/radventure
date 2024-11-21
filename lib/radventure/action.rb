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

    # Action constructor
    #
    # @param name [String] The general name of the action
    # @param skill [String] The name of the skill to test of the action
    # @param dc [Integer] The skill's Difficulty Class of the action
    # @param success [String] The success text of the action
    # @param failure [String] The failure text of the action
    # @param success_cache [Array<Item, Money>] A list of items and money caches available when succeeded
    # @param failure_cache [Array<Item, Money>] A list of items and money caches available when failed
    # @return [Action] The Action object
    def initialize(name, skill, dc, success, failure, success_cache = [], failure_cache = [])
      @name          = name.strip
      @skill         = skill.strip
      @dc            = dc.to_i
      @success       = success.strip
      @failure       = failure.strip
      @status        = nil
      @success_cache = success_cache
      @failure_cache = failure_cache
      @cache         = nil
    end

    # Try to roll for this action
    #
    # @param roll [Integer] The result of the roll
    # @return [Boolean] Whether the check succeeded or not
    def try(roll)
      if @status.nil?
        @status = roll.to_i >= @success
        @cache  = if @status
                    @success_cache
                  else
                    @failure_cache
                  end
      end

      @status
    end

    # Fetch rewards, if applicable
    #
    # @return [false, Array] Returns `false` if the action was not tried, or an array, otherwise
    def rewards
      if @status.nil?
        false
      else
        @cache
      end
    end

    # Retrieve a reward (and remove it) from the available rewards list
    #
    # @return [nil, Item, Money] Returns the removed reward from the rewards list, or `nil` if no rewards match
    def get_reward(index)
      if @cache.nil?
        nil
      else
        @cache.delete_at index
      end
    end
  end
end
