class CreateSpotServices < ActiveRecord::Migration[5.2]
  def change
    create_table :spot_services do |t|
      t.references :spot, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
