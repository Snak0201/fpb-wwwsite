class CreateBureauArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :bureau_articles do |t|
      t.references :bureau, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
