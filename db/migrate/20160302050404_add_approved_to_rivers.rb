class AddApprovedToRivers < ActiveRecord::Migration
  def change
    add_column :rivers, :approved, :boolean, default: false
  end
end
