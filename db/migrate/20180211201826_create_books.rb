class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.integer :teacher_id 
      t.integer :subject_id   
      t.string  :book_name
      t.string :book_description
      t.string :url_path
      t.string :book_weights_string_list
      t.timestamps
    end
  end
end
