# frozen_string_literal: true

# Vendor stores seller data
class Vendor < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :address

  validates :name, presence: true, uniqueness: true
end
