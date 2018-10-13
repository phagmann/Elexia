class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.integer :box_id
      t.integer :user_id
      t.integer :note_type
      t.string :text
      t.timestamps
    end
  end
end
