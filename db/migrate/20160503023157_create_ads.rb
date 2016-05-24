class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
