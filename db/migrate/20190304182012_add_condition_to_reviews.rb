class AddConditionToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :condition, :integer
  end
end
