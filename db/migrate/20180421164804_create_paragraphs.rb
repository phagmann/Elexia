class CreateParagraphs < ActiveRecord::Migration[5.1]
  def change
    create_table :paragraphs do |t|
      t.integer :box_id
      t.integer :note_type
      t.string :paragraph_text
      t.timestamps
    end
  end
end
