# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Credits::ListUserCredits do
  subject(:list_user_credits) do
    described_class.new(user_id:)
  end

  describe '#call' do
    let(:user) { create(:user) }
    let(:total_amount) { credits.sum(&:amount) }
    let(:user_id) { user.id }

    context 'when the user have credits' do
      let!(:credits) { create_list(:credit, 3, user:, amount: 10) }

      it 'returns user credits' do
        expect(list_user_credits.call).to eq({ total: total_amount, data: credits })
      end
    end

    context 'when the user does not have credits' do
      let(:credits) { [] }

      it 'returns empty' do
        expect(list_user_credits.call).to eq({ total: 0, data: credits })
      end
    end

    context 'when the user does not exist' do
      let(:credits) { create_list(:credit, 3, amount: 10) }
      let(:user_id) { 99_999 }

      it 'throws user not found exception' do
        expect do
          list_user_credits.call
        end.to raise_error(ActiveRecord::RecordNotFound, "Couldn't find User with 'id'=#{user_id}")
      end
    end
  end
end
