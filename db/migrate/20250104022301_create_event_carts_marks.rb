class CreateEventCartsMarks < ActiveRecord::Migration[7.2]
  def change
    create_table :event_carts_marks, comment: "買いたいもの" do |t|
      t.references :cart, null: false, foreign_key: { to_table: :event_carts_carts }, comment: "カート"
      t.integer :status, null: false, default: 0, comment: "ステータス"
      t.string :name, null: false, comment: "名称"
      t.string :place_1st, comment: "配置場所1"
      t.string :place_2nd, comment: "配置場所2"
      t.string :place_3rd, comment: "配置場所3"
      t.string :circle_name, comment: "サークル名"
      t.integer :budget, comment: "予算"
      t.string :circle_sns, comment: "サークルのSNS"
      t.text :memo, comment: "メモ"
      t.datetime :status_changed_at, comment: "ステータスの変更日時"
      t.integer :order_number, null: false, default: 0, comment: "並び変え順"

      t.timestamps
    end
  end
end
