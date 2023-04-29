# frozen_string_literal: true

FactoryBot.define do
  factory :credit do
    amount { 100 }
    user

    trait :without_user do
      user { nil }
    end
  end
end
