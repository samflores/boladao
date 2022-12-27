# frozen_string_literal: true

class Tournament < ApplicationRecord
  has_many :groups, dependent: :destroy

  validates :name, presence: true
  validates :ends_at, comparison: { greater_than: :starts_at }
end
