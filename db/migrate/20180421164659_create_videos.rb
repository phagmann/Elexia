class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.integer :box_id
      t.integer :note_type
      t.string :video_url
      t.string :video_path
      t.integer :video_is_path?, default: 0
      t.timestamps
    end
  end
end
