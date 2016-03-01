class AddPutInAndTakeOutToRivers < ActiveRecord::Migration
  def change
    add_column :rivers, :put_in, :string
    add_column :rivers, :take_out, :string
    remove_column :rivers, :location
  end
end
