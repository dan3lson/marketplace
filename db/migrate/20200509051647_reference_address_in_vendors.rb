class ReferenceAddressInVendors < ActiveRecord::Migration[6.0]
  def change
    add_reference :vendors, :address, type: :uuid, foreign_key: true, null: false
  end
end
