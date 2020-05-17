# frozen_string_literal: true

# Vendor stores seller data.
class Vendor < ApplicationRecord
  belongs_to :vendor_manager
  belongs_to :address
  has_many :products, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
