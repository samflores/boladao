# frozen_string_literal: true

module Credits
  class ListUserCredits
    def initialize(user_id:)
      @user_id = user_id
    end

    def call
      user = User.find(user_id)

      credits = user.credits

      { total: credits.sum(:amount), data: credits }
    end

    private

    attr_reader :user_id
  end
end
