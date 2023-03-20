# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :tournament
  belongs_to :team_a, class_name: 'Team'
  belongs_to :team_b, class_name: 'Team'

  enum :phase, {
    group: 0,
    round_16: 1,
    round_8: 2,
    semi_finals: 3,
    final: 4
  }, prefix: true

  validates :starts_at, presence: true
  validates :tournament, presence: true
  validates :team_a, presence: true
  validates :team_b, presence: true
  validate :team_a_cannot_be_equal_to_team_b

  def team_a_cannot_be_equal_to_team_b
    return unless team_a_id == team_b_id

    errors.add(:team_a, "can't be equal to team b")
    errors.add(:team_b, "can't be equal to team a")
  end
end
