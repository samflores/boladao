# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:tournament) }
    it { is_expected.to belong_to(:team_a).class_name('Team') }
    it { is_expected.to belong_to(:team_b).class_name('Team') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:starts_at) }
    it { is_expected.to validate_presence_of(:tournament) }
    it { is_expected.to validate_presence_of(:team_a) }
    it { is_expected.to validate_presence_of(:team_b) }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:phase).with_prefix }
  end
end
