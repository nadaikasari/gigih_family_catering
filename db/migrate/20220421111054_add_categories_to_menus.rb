class AddCategoriesToMenus < ActiveRecord::Migration[7.0]
  def change
    add_column :menus, :categories, :text, array: true, default: [].to_yaml
  end
end
