# frozen_string_literal: true

module Radventure
  # Represents an ingame possible action
  class Action
    attr_reader :name, :skill, :tried, :success, :failure

    @dc = 10

    # Action constructor.
    #
    # @return [Action] The Action object
    def initialize(name, skill, dc, success, failure, crit_success = nil, crit_failure = nil)
      @name = name.strip
      @skill = skill.strip
      @dc = dc.to_i
      @success = success.strip
      @failure = failure.strip
      @tried = false
    end
  end
end
