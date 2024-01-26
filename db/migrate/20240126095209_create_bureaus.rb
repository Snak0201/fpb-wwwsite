class CreateBureaus < ActiveRecord::Migration[7.0]
  def change
    create_table :bureaus do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :content

      t.timestamps
    end

    add_index :bureaus, :name, unique: true
    add_index :bureaus, :slug, unique: true
  end
end
