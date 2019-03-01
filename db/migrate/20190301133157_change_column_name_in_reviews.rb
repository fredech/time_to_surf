class ChangeColumnNameInReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :session_id, :surf_session_id
  end
end
