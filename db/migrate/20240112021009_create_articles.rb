class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content
      t.integer :number, null: false, default: 0
      t.datetime :published_at

      t.timestamps
    end

    add_index :articles, :title
    add_index :articles, :number
  end
end
