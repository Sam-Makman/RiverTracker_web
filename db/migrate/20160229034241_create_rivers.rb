class CreateRivers < ActiveRecord::Migration
  def change
    create_table :rivers do |t|
      t.string :name
      t.string :section
      t.string :difficulty
      t.integer :usgs_id
      t.text :details
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :rivers, [:name, :user_id]
  end
end
