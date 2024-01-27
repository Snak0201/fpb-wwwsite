class AddIndexToBureauArticles < ActiveRecord::Migration[7.0]
  def change
    add_index :bureau_articles, [:bureau_id, :article_id], unique: true
  end
end
