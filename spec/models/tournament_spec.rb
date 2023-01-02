# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tournament do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it 'requires ends_at to be greater than starts_at' do
      invalid_tournament = build(:tournament, starts_at: Time.current, ends_at: 2.weeks.ago)

      expect(invalid_tournament).not_to be_valid
    end
  end

  context 'associations' do
    it { is_expected.to have_many(:groups) }
  end
end
