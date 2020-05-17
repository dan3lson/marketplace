# frozen_string_literal: true

#
# Roles
#
Role.destroy_all

names = %i[customer vendor_manager master_admin]
names.map { |name| Role.create!(name: name) }

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

23.times do
  user_type = %w[customer vendor_manager].sample
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'Testing1234!',
  )
  user_type.classify.constantize.create!(user: user)
  role = Role.find_by(name: user_type)
  user.assignments.create!(role: role)
end

#
# Vendors
#
Vendor.destroy_all

23.times do
  Vendor.create!(
    name: Faker::Company.unique.name,
    address: Address.all.sample,
    vendor_manager: VendorManager.all.sample
    )
end

#
# Products
#
vendors = Vendor.all

112.times do
  vendor = vendors.sample
  vendor.products.create!(name: Faker::Commerce.product_name)
end
