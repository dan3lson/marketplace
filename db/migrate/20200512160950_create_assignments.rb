class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments, id: :uuid do |t|
      t.references :role, type: :uuid, null: false, foreign_key: true
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
    add_index :assignments, %i[user_id role_id], unique: true
  end
end
