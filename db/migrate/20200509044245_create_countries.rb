class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries, id: :uuid do |t|
      t.string :name, null: false, size: 80
      t.string :iso,  null: false, size: 2, index: true, unique: true
      t.string :iso3, null: false, size: 3, index: true, unique: true

      t.timestamps
    end
  end
end
