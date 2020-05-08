# frozen_string_literal: true

FactoryBot.define do
  factory :vendor do
    name { Faker::Company.name }
  end
end
