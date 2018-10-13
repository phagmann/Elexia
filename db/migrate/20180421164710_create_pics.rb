class CreatePics < ActiveRecord::Migration[5.1]
  def change
    create_table :pics do |t|
      t.integer :box_id
      t.integer :note_type
      t.string :pic_url
      t.string :pic_path
      t.integer :pic_is_path?, default: 0
      t.timestamps
    end
  end
end
