# frozen_string_literal: true

FactoryBot.define do
  factory :vendor_manager do
    user

    after(:create) do |customer|
      role = Role.find_by(name: 'vendor_manager') || create(:role, :vendor_manager)
      customer.user.assignments.create!(role: role)
    end
  end
end
