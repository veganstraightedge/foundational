class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.references :tag, null: false, foreign_key: true
      t.integer :taggable_id
      t.string :taggable_type

      t.timestamps
    end
  end
end
