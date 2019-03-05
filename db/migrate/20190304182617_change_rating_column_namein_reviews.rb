class ChangeRatingColumnNameinReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :rating, :access
  end
end
