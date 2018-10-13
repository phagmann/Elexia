class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.integer :teacher_id 
      t.string  :subject_name
      t.string :subject_description
      t.string :url_path
      t.timestamps
    end
  end
end
