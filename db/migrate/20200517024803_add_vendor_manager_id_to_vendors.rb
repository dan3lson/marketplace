class AddVendorManagerIdToVendors < ActiveRecord::Migration[6.0]
  def change
    add_reference :vendors, :vendor_manager, type: :uuid, null: false, foreign_key: true
  end
end
