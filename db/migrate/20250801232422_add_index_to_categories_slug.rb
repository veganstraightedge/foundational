class AddIndexToCategoriesSlug < ActiveRecord::Migration[8.0]
  def change
    add_index :categories, :slug, unique: true
  end
end
