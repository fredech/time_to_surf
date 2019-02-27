class ChangeDifficulyLevelToBeFloatAgainInSpots < ActiveRecord::Migration[5.2]
  def change
    change_column :spots, :difficulty_level, :float
  end
end
