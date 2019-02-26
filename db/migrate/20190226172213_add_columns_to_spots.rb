class AddColumnsToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :seabed, :string
    add_column :spots, :best_tide, :string
    add_column :spots, :difficulty_level, :integer
  end
end
