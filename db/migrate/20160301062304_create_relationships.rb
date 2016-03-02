class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :favorited_id
      t.integer :favoriter_id

      t.timestamps null: false
    end
    add_index :relationships, :favorited_id
    add_index :relationships, :favoriter_id
    add_index :relationships, [:favorited_id, :favoriter_id], unique: true

  end
end
