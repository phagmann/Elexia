class CreateSolves < ActiveRecord::Migration[5.1]
  def change
    create_table :solves do |t|
      t.integer :box_id
      t.integer :note_type
      t.string :solve_math
      t.timestamps
    end
  end
end
