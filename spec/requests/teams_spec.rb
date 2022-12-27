# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Teams' do
  before do
    Team.create(name: 'Brasil', short_name: 'BRA')
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/teams'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      team = Team.last
      get "/teams/#{team.short_name}"
      expect(response).to have_http_status(:success)
    end
  end
end
