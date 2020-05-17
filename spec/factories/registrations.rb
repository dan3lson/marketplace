# frozen_string_literal: true

FactoryBot.define do
  factory :registration do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'password' }
    user_type { 'customer' }

    trait :vendor_manager do
      user_type { 'vendor_manager' }
    end
  end
end
