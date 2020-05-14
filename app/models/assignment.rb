# frozen_string_literal: true

# Assignment stores joins data between roles and users.
class Assignment < ApplicationRecord
  belongs_to :role
  belongs_to :user

  validates :user, uniqueness: { scope: :role_id }
end
