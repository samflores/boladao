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

  describe '#team_a_cannot_be_equal_to_team_b' do
    let(:team) { build(:team) }
    let(:invalid_match) {
      build(
        :match,
        team_a: Team.new(id: 1, name: 'Brazil', short_name: 'BRA'),
        team_b: Team.new(id: 1, name: 'Brazil', short_name: 'BRA')
      )
    }
    
    it 'adds errors if team_a is equal to team_b' do
      invalid_match.valid?
      expect(invalid_match.errors[:team_a]).to include("can't be equal to team b")
      expect(invalid_match.errors[:team_b]).to include("can't be equal to team a")
    end
  end
end
