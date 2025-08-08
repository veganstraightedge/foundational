class AddUniqueIndexToSettings < ActiveRecord::Migration[8.0]
  def change
    add_index :settings, :name, unique: true
  end
end
