# frozen_string_literal: true

module Api
  module V1
    # VendorSerializer presents Vendor data.
    class VendorSerializer
      include FastJsonapi::ObjectSerializer

      attributes :name
    end
  end
end
