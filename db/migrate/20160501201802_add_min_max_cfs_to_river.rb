class AddMinMaxCfsToRiver < ActiveRecord::Migration
  def change
    add_column :rivers, :max_cfs, :integer
    add_column :rivers, :min_cfs, :integer
  end
end
