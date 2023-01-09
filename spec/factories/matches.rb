FactoryBot.define do
  factory :match do
    starts_at { "2023-01-02 17:40:13" }
    location { "MyString" }
    phase { 1 }
    tournament { nil }
    team_a { nil }
    team_b { nil }
  end
end
