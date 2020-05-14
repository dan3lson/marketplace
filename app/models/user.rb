# frozen_string_literal: true

# User stores customer data.
class User < ApplicationRecord
  has_secure_password

  has_one :customer, dependent: :destroy
  has_one :vendor_manager, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :roles, through: :assignments

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end
end
