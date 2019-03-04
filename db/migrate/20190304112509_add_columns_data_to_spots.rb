class AddColumnsDataToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :data_weather_online, :jsonb
    add_column :spots, :data_msw, :jsonb
  end
end
