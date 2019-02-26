class RenameSessionsToSurfSessions < ActiveRecord::Migration[5.2]
  def change
    rename_table :sessions, :surf_sessions
  end
end
