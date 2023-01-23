FactoryBot.define do
  factory :match do
    starts_at { "2023-01-02 17:40:13" }
    location { "Maracanã" }
    phase { 1 }
    tournament
    team_a { Team.new(id: 1, name: 'Brazil', short_name: 'BRA') }
    team_b { Team.new(id: 2, name: 'Spain', short_name: 'SPA') }
  end
end
