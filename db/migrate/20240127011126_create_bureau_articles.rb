class CreateBureauArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :bureau_articles do |t|
      # government_bureau_id が bureau の id と紐づく
      t.references :government_bureau, null: false, foreign_key: {to_table: :bureaus}
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
