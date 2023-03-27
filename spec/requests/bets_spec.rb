# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Bets' do
  describe "GET /index" do
    it 'returns http success' do
      get '/bets/index'
      expect(response).to have_http_status(:success)
    end
  end

end
