# frozen_string_literal: true

# Product stores seller data
class Product < ApplicationRecord
  GUEST_ACCESS = 2

  belongs_to :vendor

  validates :name, presence: true

  scope :for_guests, -> { limit(GUEST_ACCESS) }
end
