class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
  
      t.integer :student_id
      t.integer :book_id
      t.integer :assignment_id
      t.integer :grade_weight_index
      t.integer :order_placement
      t.float :score_out_of_points
      t.string :teacher_note_for_grade
      t.timestamps
    end
  end
end
