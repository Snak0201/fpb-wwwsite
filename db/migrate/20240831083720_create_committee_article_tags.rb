class CreateCommitteeArticleTags < ActiveRecord::Migration[7.0]
  def change
    create_table :committee_article_tags do |t|
      t.references :committee, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
    add_index :committee_article_tags, [:committee_id, :article_id], unique: true
  end
end
