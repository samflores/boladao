# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Credits::BuyCredits do
  subject(:buy_credits) do
    described_class.new(
      credit: credit.attributes,
      user:,
      credit_card:
    )
  end

  let(:credit) { build(:credit, :without_user) }
  let(:user) { build(:user) }
  let(:valid_card_expiration_year) { Time.now.year + 1 }
  let(:credit_card) do
    {
      'card_name' => card_name,
      'card_number' => card_number,
      'card_expiration_month' => '12',
      'card_expiration_year' => valid_card_expiration_year,
      'cart_security_code' => '123'
    }
  end

  describe '#call' do
    context 'when the credit card has valid params' do
      let(:credit_card) do
        {
          'card_name' => 'John Doe',
          'card_number' => '4242 4242 4242 4242',
          'card_expiration_month' => '12',
          'card_expiration_year' => valid_card_expiration_year,
          'cart_security_code' => '123'
        }
      end

      it 'save user credits' do
        expect { buy_credits.call }.to change(Credit, :count).by(1)
      end
    end

    context 'when card name is not present' do
      let(:credit_card) do
        {
          'card_name' => nil,
          'card_number' => '0000 0000 0000 0000',
          'card_expiration_month' => '12',
          'card_expiration_year' => '2024',
          'cart_security_code' => '123'
        }
      end

      it 'raises an error' do
        expect { buy_credits.call }.to raise_error(Credits::BuyCreditsError, 'Invalid credit card')
      end
    end

    context 'when card number is not invalid' do
      let(:credit_card) do
        {
          'card_name' => 'John Doe',
          'card_number' => '0000 0000 0000 0000',
          'card_expiration_month' => '12',
          'card_expiration_year' => '2024',
          'cart_security_code' => '123'
        }
      end

      it 'raises an error' do
        expect { buy_credits.call }.to raise_error(Credits::BuyCreditsError, 'Invalid credit card')
      end
    end

    context 'when card expiration is not invalid' do
      let(:credit_card) do
        {
          'card_name' => 'John Doe',
          'card_number' => '0000 0000 0000 0000',
          'card_expiration_month' => '12',
          'card_expiration_year' => Time.now.year - 1,
          'cart_security_code' => '123'
        }
      end

      it 'raises an error' do
        expect { buy_credits.call }.to raise_error(Credits::BuyCreditsError, 'Invalid credit card')
      end
    end
  end
end
