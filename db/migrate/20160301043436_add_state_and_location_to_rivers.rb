class AddStateAndLocationToRivers < ActiveRecord::Migration
  def change
    add_column :rivers, :state, :string
    add_column :rivers, :location, :string
  end
end
