class AddNewColumnsToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :msw_id, :integer
  end
end
