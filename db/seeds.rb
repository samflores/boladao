# frozen_string_literal: true

print "...creating teams..."
(1..32).each do |number|
  Team.create(name: "Team #{number}", short_name: "T#{number.to_s.rjust(2, '0')}")
end

print "...creating tournaments..."
Tournament.create(name: "World Cup 2014", starts_at: Time.current, ends_at: 2.weeks.from_now)

print "...creating groups..."
groups = ('A'..'H').to_a
groups.each do |group|
  Group.create!(name: "Group #{group}", teams: Team.all.each_slice(4).to_a[groups.index(group)], tournament: Tournament.first)
end
