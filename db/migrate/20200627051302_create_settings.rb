class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.string :name
      t.text   :description
      t.text   :content
      t.string :form_control

      t.timestamps
    end
  end
end
