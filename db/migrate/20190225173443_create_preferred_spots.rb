class CreatePreferredSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :preferred_spots do |t|
      t.references :spot, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
