# frozen_string_literal: true

FactoryBot.define do
  factory :country do
    name { Faker::Address.country }
    iso { Faker::Address.unique.country_code }
    iso3 { Faker::Address.unique.country_code_long }
  end
end
