require 'rails_helper'

RSpec.describe Credit, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0).only_integer }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
