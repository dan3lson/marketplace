class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :street
      t.string :street2
      t.string :city
      t.string :province
      t.string :postal_code
      t.references :country, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
