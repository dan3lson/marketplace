# frozen_string_literal: true

module Api
  module V1
    module Vendors
      # ProductSerializer presents Product data for their vendor.
      class ProductSerializer
        include FastJsonapi::ObjectSerializer

        attributes :name
      end
    end
  end
end
