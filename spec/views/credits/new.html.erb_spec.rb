# frozen_string_literal: true

require 'rails_helper'

describe 'credits/new.html.erb', type: :feature do
  let(:user) { create(:user) }

  before { login_as(user) }

  it 'displays Buy Credits form title' do
    visit '/credits/new'

    expect(page).to have_selector('h2', text: 'Buy Credits')
  end

  context 'when credit card is not valid' do
    it 'shows invalid credit card message' do
      visit '/credits/new'

      fill_in 'credit_amount', with: '100'
      fill_in 'credit_card_name', with: 'John Doe'
      fill_in 'credit_card_number', with: '123'
      select '03', from: 'credit_card_expiration_month'
      select Time.now.year + 1, from: 'credit_card_expiration_year'
      fill_in 'credit_cart_security_code', with: '123'

      click_on 'Buy'

      expect(page).to have_selector('p', text: 'Invalid credit card')
    end
  end

  context 'when credit card is valid' do
    it 'shows invalid credit card message' do
      visit '/credits/new'

      amount_added = 100

      fill_in 'credit_amount', with: amount_added
      fill_in 'credit_card_name', with: 'John Doe'
      fill_in 'credit_card_number', with: '4242 4242 4242 4242'
      select '03', from: 'credit_card_expiration_month'
      select Time.now.year + 1, from: 'credit_card_expiration_year'
      fill_in 'credit_cart_security_code', with: '123'

      click_on 'Buy'

      expect(page).to have_selector('p', text: "#{amount_added} credits were added!")
    end
  end
end
