class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name, null: false, index: true, unique: true
      t.references :vendor, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
