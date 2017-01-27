class CreatePodcasts < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasts do |t|
      t.string :name
      t.boolean :watched
      t.integer :user_id
  end
end
end
