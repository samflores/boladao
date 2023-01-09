# frozen_string_literal: true

class Team < ApplicationRecord
  PAGE_SIZE = 12

  has_many :matches_as_a, inverse_of: :team_a, class_name: "Match"
  has_many :matches_as_b, inverse_of: :team_b, class_name: "Match"

  has_and_belongs_to_many :groups

  validates :name,
            presence: true,
            uniqueness: true
  validates :short_name,
            presence: true,
            uniqueness: true,
            length: { is: 3 }

  scope :in_page, ->(page) { offset(((page || 1).to_i - 1) * PAGE_SIZE).limit(PAGE_SIZE) }
  scope :with_short_name, ->(short_name) { where(short_name:) if short_name }

  def to_param
    short_name
  end
end
