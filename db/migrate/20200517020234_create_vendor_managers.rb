class CreateVendorManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :vendor_managers, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
