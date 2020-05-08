# frozen_string_literal: true

# User stores customer data.
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end
