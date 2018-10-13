class CreateBookVisitLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :book_visit_logs do |t|
      t.integer :user_id
      t.integer :book_id
      t.timestamps
    end
  end
end
