# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Credits::BuyCredits do
  subject(:buy_credits) do
    described_class.new(
      credit:,
      user:,
      credit_card:
    )
  end

  let(:credit) { build(:credit, :without_user) }
  let(:user) { build(:user) }
  let(:credit_card) do
    {
      'card_name' => card_name,
      'card_number' => card_number,
      'card_expiration' => '12/24',
      'cart_security_code' => '123'
    }
  end

  describe '#call' do
    context 'when the credit card has valid params' do
      let(:credit_card) do
        {
          'card_name' => 'John Doe',
          'card_number' => '4242 4242 4242 4242',
          'card_expiration' => '12/24',
          'cart_security_code' => '123'
        }
      end

      it 'sets the user on the credit card' do
        expect { buy_credits.call }.to change(credit, :user).from(nil).to(user)
      end
    end

    context 'when card name is not present' do
      let(:credit_card) do
        {
          'card_name' => nil,
          'card_number' => '0000 0000 0000 0000',
          'card_expiration' => '12/24',
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
          'card_expiration' => '12/24',
          'cart_security_code' => '123'
        }
      end

      it 'raises an error' do
        expect { buy_credits.call }.to raise_error(Credits::BuyCreditsError, 'Invalid credit card')
      end
    end
  end
end
