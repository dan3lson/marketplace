# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { 'customer' }

    trait :vendor do
      name { 'vendor' }
    end

    trait :master_admin do
      name { 'master_admin' }
    end
  end
end
