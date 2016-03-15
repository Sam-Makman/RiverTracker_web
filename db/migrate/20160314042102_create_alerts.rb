class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :river_id
      t.string :title
      t.text :details

      t.timestamps null: false
    end
    add_index :alerts, :river_id
  end
end
