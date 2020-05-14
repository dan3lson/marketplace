# frozen_string_literal: true

# Role stores authorization types.
class Role < ApplicationRecord
  has_many :assignments, dependent: :restrict_with_error
  has_many :users, through: :assignments

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
