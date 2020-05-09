# frozen_string_literal: true

module Api
  module V1
    module Vendors
      # AddressSerializer presents data for a vendor's location.
      class AddressSerializer
        include FastJsonapi::ObjectSerializer

        attributes :street, :street2, :city, :province, :postal_code
      end
    end
  end
end
