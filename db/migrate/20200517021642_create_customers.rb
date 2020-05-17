class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
    end
  end
end
