class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.text :description
      t.float :price
      t.text :category, array: true

      t.timestamps
    end
  end
end
