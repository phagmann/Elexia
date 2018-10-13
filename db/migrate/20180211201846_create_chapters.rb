class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.integer :teacher_id 
      t.integer :subject_id 
      t.integer :book_id 
      t.integer :section_id 
      t.string  :chapter_name
      t.string :chapter_description
      t.string :url_path
      t.timestamps
    end
  end
end
