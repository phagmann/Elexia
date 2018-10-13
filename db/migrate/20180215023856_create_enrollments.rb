class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.integer :teacher_id 
      t.integer :student_id
      t.integer :subject_id 
      t.integer :book_id 
      t.timestamps
    end
  end
end
