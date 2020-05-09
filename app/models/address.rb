# frozen_string_literal: true

# Address stores the location of a vendor.
class Address < ApplicationRecord
  belongs_to :country
  has_many :vendors, dependent: :restrict_with_error

  validates :street, presence: true
  validates :city, presence: true
  validates :province, presence: true
  validates :postal_code, presence: true
end
