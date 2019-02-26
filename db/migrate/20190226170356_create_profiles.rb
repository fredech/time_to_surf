class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :level
      t.string :address
      t.references :user, foreign_key: true
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
