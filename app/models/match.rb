class Match < ApplicationRecord
  belongs_to :tournament
  belongs_to :team_a, class_name: 'Team'
  belongs_to :team_b, class_name: 'Team'

  enum :phase, {
    group: 0,
    round_16: 1,
    round_8: 2,
    semi_finals: 3,
    final: 4,
  }, prefix: true
end
