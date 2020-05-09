# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    street { Faker::Address.street_name }
    street2 { [Faker::Address.secondary_address, nil].sample }
    city { Faker::Address.city }
    province { Faker::Address.state }
    postal_code { Faker::Address.zip_code }

    country
  end
end
