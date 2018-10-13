class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :category
      t.string :title
      t.integer :order_cato
      t.integer :order_title
      t.string :url_path
      t.string :hierarchy
      t.timestamps
    end
  end
end
