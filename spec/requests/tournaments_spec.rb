# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tournaments' do
  describe 'GET /index' do
    it 'returns http success' do
      get '/tournaments'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let(:tournament) { create(:tournament) }

    it 'returns http success' do
      get "/tournaments/#{tournament.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
