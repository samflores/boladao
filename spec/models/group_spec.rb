# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:tournament) }
    it { is_expected.to have_and_belong_to_many(:teams) }
  end
end
