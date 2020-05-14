# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    user

    after(:create) do |customer|
      role = Role.find_by(name: 'customer') || create(:role)
      customer.user.assignments.create!(role: role)
    end
  end
end
