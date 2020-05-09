# frozen_string_literal: true

#
# Countries
#
Country.destroy_all

countries = ISO3166::Country.countries.map do |country|
  {
    name:       country.name,
    iso:        country.alpha2,
    iso3:       country.alpha3,
    created_at: Time.current,
    updated_at: Time.current
  }
end

Country.upsert_all(countries)

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
  Vendor.create!(name: Faker::Company.unique.name, address: Address.all.sample)
end

#
# Products
#
vendors = Vendor.all

112.times do
  vendor = vendors.sample
  vendor.products.create!(name: Faker::Commerce.product_name)
end
