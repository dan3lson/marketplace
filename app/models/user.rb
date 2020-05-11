# frozen_string_literal: true

# User stores customer data.
class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
