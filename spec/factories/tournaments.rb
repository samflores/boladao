# frozen_string_literal: true

FactoryBot.define do
  factory :tournament do
    sequence(:name) { |n| "Tournament #{n}" }
    starts_at { Time.current }
    ends_at { 2.weeks.from_now }
  end
end
