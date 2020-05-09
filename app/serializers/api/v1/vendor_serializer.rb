# frozen_string_literal: true

module Api
  module V1
    # VendorSerializer presents Vendor data.
    class VendorSerializer
      include FastJsonapi::ObjectSerializer

      belongs_to :address, serializer: Api::V1::Vendors::AddressSerializer

      attributes :name
    end
  end
end
