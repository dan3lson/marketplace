# frozen_string_literal: true

# Customer is an abstraction of a User.
class VendorManager < ApplicationRecord
  belongs_to :user
  has_many :vendors, dependent: :restrict_with_error
end
