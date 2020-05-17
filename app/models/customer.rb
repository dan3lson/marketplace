# frozen_string_literal: true

# Customer is an abstraction of a User.
class Customer < ApplicationRecord
  belongs_to :user
end
