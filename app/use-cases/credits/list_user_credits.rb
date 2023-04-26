module Credits
  class ListUserCredits
    def initialize(user_id:)
      @user_id = user_id
    end

    def call
      credits = Credit.where(user_id: @user_id)

      { total: credits.sum(:amount), data: credits }
    end
  end
end
