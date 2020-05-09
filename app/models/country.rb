# frozen_string_literal: true

# Country stores data for countries around the world.
class Country < ApplicationRecord
  has_many :addresses, dependent: :restrict_with_error

  validates :name, presence: true
  validates :iso,  presence: true, length: { is: 2 }, uniqueness: true
  validates :iso3, presence: true, length: { is: 3 }, uniqueness: true
end
