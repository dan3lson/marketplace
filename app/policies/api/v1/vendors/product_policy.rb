# frozen_string_literal: true

module Api
  module V1
    module Vendors
      # ProductPolicy sets authorization for products.
      class ProductPolicy < ApplicationPolicy
        def index?
          owner_id = record.
            joins(vendor: [vendor_manager: :user]).
            distinct.
            pluck('users.id').
            first

          user.role?(:vendor_manager) && owner_id == user.id
        end
      end
    end
  end
end
