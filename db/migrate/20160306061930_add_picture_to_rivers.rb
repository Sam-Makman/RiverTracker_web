class AddPictureToRivers < ActiveRecord::Migration
  def change

    add_column :rivers, :picture, :string
  end
end
