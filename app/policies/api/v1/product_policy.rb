# frozen_string_literal: true

module Api
  module V1
    # ProductPolicy sets authorization for products.
    class ProductPolicy < ApplicationPolicy
      class Scope < Scope
        def resolve
          if user.role?(:guest)
            scope.for_guests
          else
            scope
          end
        end
      end

      def index?
        user.role?(:guest) || user.role?(:customer)
      end
    end
  end
end
