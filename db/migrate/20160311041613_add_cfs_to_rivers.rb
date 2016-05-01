class AddCfsToRivers < ActiveRecord::Migration
  def change
    add_column :rivers, :cfs, :integer
  end
end
