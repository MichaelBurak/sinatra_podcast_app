class ChangeWatchedToListened < ActiveRecord::Migration[5.0]
  def change
    rename_column :podcasts, :watched, :listened
  end
end
