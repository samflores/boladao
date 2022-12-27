# frozen_string_literal: true

class Team < ApplicationRecord
  PAGE_SIZE = 12

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
