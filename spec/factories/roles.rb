# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { 'customer' }

    trait :vendor_manager do
      name { 'vendor_manager' }
    end

    trait :master_admin do
      name { 'master_admin' }
    end
  end
end
