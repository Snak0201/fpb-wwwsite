class CreateCommittees < ActiveRecord::Migration[7.0]
  def change
    create_table :committees do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :description, null: false, default: ""
      t.text :content
      t.references :bureau, null: true, foreign_key: true

      t.timestamps
    end
    add_index :committees, :name, unique: true
    add_index :committees, :slug, unique: true
  end
end
