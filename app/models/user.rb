# frozen_string_literal: true

# User stores customer data.
class User < ApplicationRecord
  has_secure_password

  has_many :assignments, dependent: :destroy
  has_many :roles, through: :assignments

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
