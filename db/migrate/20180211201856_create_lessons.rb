class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.integer :teacher_id 
      t.integer :subject_id 
      t.integer :book_id 
      t.integer :section_id 
      t.integer :chapter_id 
      t.string  :lesson_name
      t.string :lesson_description
      t.string :url_path
      t.timestamps
    end
  end
end
