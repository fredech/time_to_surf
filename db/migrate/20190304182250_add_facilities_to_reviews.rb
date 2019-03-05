class AddFacilitiesToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :facilities, :integer
  end
end
