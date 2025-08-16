class AddNameAndUsernameToUsers < ActiveRecord::Migration[8.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :name
      t.string :username, null: false
    end

    add_index :users, :username, unique: true
  end
end
