# frozen_string_literal: true

FactoryBot.define do
  factory :country do
    name { Faker::Address.country }
    iso { Faker::Address.country_code }
    iso3 { Faker::Address.country_code_long }
  end
end
