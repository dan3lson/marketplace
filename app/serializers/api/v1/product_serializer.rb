# frozen_string_literal: true

module Api
  module V1
    # ProductSerializer presents Product data.
    class ProductSerializer
      include FastJsonapi::ObjectSerializer

      attributes :name

      belongs_to :vendor
    end
  end
end
