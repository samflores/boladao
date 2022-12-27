# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :tournament
  has_and_belongs_to_many :teams

  validates :name, presence: true
end
