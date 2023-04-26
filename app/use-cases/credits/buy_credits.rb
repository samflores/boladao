module Credits
  class BuyCredits
    def initialize(credit:, user:)
      @credit = credit
      @user = user
    end

    def call
      # TODO: Call Credit Card external service

      @credit.user = @user
      @credit.save!
    end
  end
end
