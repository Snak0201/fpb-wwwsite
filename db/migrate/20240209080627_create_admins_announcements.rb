class CreateAdminsAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :admins_announcements do |t|
      t.text :content

      t.timestamps
    end
  end
end
