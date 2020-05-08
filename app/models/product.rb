# frozen_string_literal: true

# Product stores seller data
class Product < ApplicationRecord
  belongs_to :vendor

  validates :name, presence: true
end
