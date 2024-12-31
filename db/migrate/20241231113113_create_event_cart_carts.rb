class CreateEventCartCarts < ActiveRecord::Migration[7.2]
  def change
    create_table :event_cart_carts, comment: "カート" do |t|
      t.string :name, comment: "イベント名", null: false
      t.date :held_at, comment: "開催日", null: false
      t.string :place, comment: "会場"
      t.string :atlas, comment: "会場の地図"
      t.text :memo, comment: "メモ"
      t.string :unique_code, comment: "ユニークコード", null: false, unique: true
      t.boolean :disabled, comment: "無効化", default: false, null: false
      t.datetime :disabled_at, comment: "無効化日時"

      t.timestamps
    end
  end
end
