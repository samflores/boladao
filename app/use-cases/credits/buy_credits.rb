# frozen_string_literal: true

module Credits
  class BuyCredits
    def initialize(credit:, user:, credit_card:)
      @credit = credit
      @user = user
      @credit_card_service = CreditCardService.new(
        card_name: credit_card['card_name'],
        card_number: credit_card['card_number'],
        card_expiration: credit_card['card_expiration'],
        cart_security_code: credit_card['cart_security_code']
      )
    end

    def call
      raise ::Credits::BuyCreditsError, 'Invalid credit card' unless credit_card_service.validate?

      new_credit = Credit.new(credit)

      new_credit.user = user
      new_credit.amount = new_credit.amount * 100
      new_credit.save!
    end

    private

    attr_reader :credit, :credit_card_service, :user
  end
end
