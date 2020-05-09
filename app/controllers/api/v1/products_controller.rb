# frozen_string_literal: true

module Api
  module V1
    # ProductsController
    class ProductsController < ApiController
      def index
        products = Product.all
        options = { include: [:vendor] }

        success body: Api::V1::ProductSerializer.new(products, options).serializable_hash
      end
    end
  end
end
