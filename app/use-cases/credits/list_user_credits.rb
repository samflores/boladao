# frozen_string_literal: true

module Credits
  class ListUserCredits
    def initialize(user_id:)
      @user_id = user_id
    end

    def call
      check_user

      credits = Credit.where(user_id:)

      { total: credits.sum(:amount), data: credits }
    end

    private

    attr_reader :user_id

    def check_user
      User.exists?(id: user_id) || raise(Credits::NotFoundUserError, 'User not found')
    end
  end
end
