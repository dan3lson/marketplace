# frozen_string_literal: true

FactoryBot.define do
  factory :registration do
    email { Faker::Internet.email }
    password { 'password' }
    roles { ['customer'] }

    trait :blank_email do
      email { '' }
    end

    trait :nil_email do
      email { nil }
    end

    trait :blank_password do
      email { '' }
    end

    trait :nil_password do
      email { nil }
    end

    trait :nonexistent_role do
      roles { ['foobar'] }
    end

    trait :multiple_roles do
      roles { %w[customer trial_vip_customer] }
    end
  end
end
