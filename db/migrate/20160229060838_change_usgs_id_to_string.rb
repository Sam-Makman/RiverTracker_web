class ChangeUsgsIdToString < ActiveRecord::Migration
  def change
    change_table :rivers do |t|
      t.change :usgs_id, :string4
    end
  end
end
