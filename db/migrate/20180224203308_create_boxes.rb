class CreateBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :boxes do |t|
      t.integer :lesson_id 
      t.integer :video_id, default: 0
      t.integer :pic_id, default: 0
      t.integer :powerpoint_id, default: 0
      t.integer :doc_id, default: 0
      t.integer :ordering
      t.string :title
      t.integer :paragraph_id, default: 0
      t.integer :solve_id, default: 0
      t.timestamps
    end
  end
end
