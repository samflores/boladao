# frozen_string_literal: true

require 'rails_helper'

describe 'access user credits page', type: :feature do
  let(:user) { create(:user) }

  before { login_as(user) }

  it 'navigate to credits page from home' do
    visit '/'

    click_on user.name
    click_on 'My Credits'

    expect(page).to have_current_path('/credits')
  end
end
