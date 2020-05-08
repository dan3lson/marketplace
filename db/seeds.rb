# frozen_string_literal: true

#
# Users
#
User.destroy_all

10.times do
  User.create!(email: Faker::Internet.email)
end
