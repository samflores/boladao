# frozen_string_literal: true

require 'rails_helper'

describe 'credits/index.html.erb', type: :feature do
  let(:user) { create(:user) }

  before { login_as(user) }

  it 'displays the buy more button' do
    # TODO: Via home page
    visit '/credits'

    expect(page).to have_selector('a', text: 'Buy more! 🤑')
  end

  context 'when clicked on the buy more button' do
    it 'redirects to the credits page' do
      visit '/credits'

      click_on 'Buy more! 🤑'

      expect(page).to have_current_path('/credits/new')
    end
  end

  context 'when there no credits' do
    it 'displays no credits message' do
      visit '/credits'

      expect(page).to have_selector('p', text: "You haven't bought credits yet 🥲")
    end

    it 'shows total amount as zero' do
      visit '/credits'

      expect(page).to have_selector('p', text: 'Total: 0')
    end
  end

  context 'when there are credits' do
    before do
      %w[100 200].each do |amount|
        create(:credit, amount: amount.to_i * 100, user:)
      end
    end

    it 'shows a credits table rows' do
      visit '/credits'

      %w[100 200].each do |amount|
        expect(page).to have_selector('td', text: amount)
      end
    end

    it 'shows update total amount' do
      visit '/credits'

      expect(page).to have_selector('p', text: 'Total: 300')
    end
  end
end
