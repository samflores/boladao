# frozen_string_literal: true

# TODO: Call an real credit card service
class CreditCardService
  def initialize(card_name:, card_number:, card_expiration_month:, card_expiration_year:, cart_security_code:)
    @card_name = card_name
    @card_number = card_number
    @card_expiration_month = card_expiration_month
    @card_expiration_year = card_expiration_year
    @cart_security_code = cart_security_code
  end

  def validate?
    not_empty_fields? && @card_number == '4242 4242 4242 4242' && valid_card_expiration?
  end

  private

  def not_empty_fields?
    fields = [card_name, card_number, card_expiration_month, card_expiration_year, cart_security_code]
    fields.all?(&:present?)
  end

  def valid_card_expiration?
    input_date = "01/#{card_expiration_month}/#{card_expiration_year}"
    Date.parse(input_date).end_of_month >= Date.today
  rescue StandardError
    false
  end

  attr_reader :card_name, :card_number, :card_expiration_month, :card_expiration_year, :cart_security_code
end
