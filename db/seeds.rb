# frozen_string_literal: true

print "...creating teams...\n"
(1..32).each do |number|
  Team.create(name: "Team #{number}", short_name: "T#{number.to_s.rjust(2, '0')}")
end

print "...creating tournaments...\n"
Tournament.create(name: "World Cup 2014", starts_at: Time.current, ends_at: 2.weeks.from_now)

print "...creating groups...\n"
groups = ('A'..'H').to_a
groups.each do |group|
  Group.create!(name: "Group #{group}", teams: Team.all.each_slice(4).to_a[groups.index(group)], tournament: Tournament.first)
end

print "...creating matches...\n"
Group.all.each do |group|
  team1, team2, team3, team4 = group.teams

  Match.create!(phase: 0, location: 'Frasqueirão', team_a: team1, team_b: team2, tournament: Tournament.first, starts_at: Time.current)
  Match.create!(phase: 0, location: 'Frasqueirão', team_a: team1, team_b: team3, tournament: Tournament.first, starts_at: Time.current)
  Match.create!(phase: 0, location: 'Frasqueirão', team_a: team1, team_b: team4, tournament: Tournament.first, starts_at: Time.current)
  Match.create!(phase: 0, location: 'Frasqueirão', team_a: team2, team_b: team3, tournament: Tournament.first, starts_at: Time.current)
  Match.create!(phase: 0, location: 'Frasqueirão', team_a: team2, team_b: team4, tournament: Tournament.first, starts_at: Time.current)
  Match.create!(phase: 0, location: 'Frasqueirão', team_a: team3, team_b: team4, tournament: Tournament.first, starts_at: Time.current)
  Match.create!(phase: 0, location: 'Frasqueirão', team_a: team4, team_b: team3, tournament: Tournament.first, starts_at: Time.current)
  Match.create!(phase: 0, location: 'Frasqueirão', team_a: team4, team_b: team1, tournament: Tournament.first, starts_at: Time.current)
end
