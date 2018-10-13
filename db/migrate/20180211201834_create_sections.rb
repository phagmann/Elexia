class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.integer :teacher_id 
      t.integer :subject_id 
      t.integer :book_id 
      t.string  :section_name
      t.string :section_description
      t.string :url_path
      t.timestamps
    end
  end
end
