# frozen_string_literal: true

module Api
  module V1
    module Vendors
      # ProductsController
      class ProductsController < ApiController
        before_action :authenticate_user

        def index
          vendor = Vendor.find(params[:vendor_id])
          products = vendor.products
          authorize! :index, products
          body = Api::V1::Vendors::ProductSerializer.new(products).serializable_hash

          success body: body
        end

        def destroy
          vendor = Vendor.find(params[:vendor_id])
          product = vendor.products.find(params[:id])

          product.destroy

          success code: 204
        end
      end
    end
  end
end
