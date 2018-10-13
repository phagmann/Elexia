class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.integer  :book_id
      t.integer :lesson_id
      t.integer :points
      t.string :assignment_title
      t.string :assignment_description
      t.timestamps
    end
  end
end
