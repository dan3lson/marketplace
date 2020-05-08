# frozen_string_literal: true

#
# Users
#
User.destroy_all

10.times do
  User.create!(email: Faker::Internet.email)
end

#
# Vendors
#
Vendor.destroy_all

21.times do
  Vendor.create!(name: Faker::Company.name)
end

#
# Products
#
vendors = Vendor.all

112.times do
  vendor = vendors.sample
  vendor.products.create!(name: Faker::Commerce.product_name)
end
