class CreateDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :docs do |t|
      t.integer :box_id
      t.integer :note_type
      t.string :doc_url
      t.string :doc_path
      t.integer :doc_is_path?, default: 0
      t.timestamps
    end
  end
end
