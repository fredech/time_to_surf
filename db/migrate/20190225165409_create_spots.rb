class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :photo
      t.string :video

      t.timestamps
    end
  end
end
