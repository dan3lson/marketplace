# frozen_string_literal: true

module Api
  module V1
    # ProductSerializer presents data for an item a vendor sells.
    class ProductSerializer
      include FastJsonapi::ObjectSerializer

      belongs_to :vendor

      attributes :name
    end
  end
end
