class CreatePowerpoints < ActiveRecord::Migration[5.1]
  def change
    create_table :powerpoints do |t|
      t.integer :box_id
      t.integer :note_type
      t.string :powerpoint_url
      t.string :powerpoint_path
      t.integer :powerpoint_is_path?, default: 0
      t.timestamps
    end
  end
end
