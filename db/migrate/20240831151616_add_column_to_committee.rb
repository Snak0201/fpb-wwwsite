class AddColumnToCommittee < ActiveRecord::Migration[7.0]
  def change
    add_column :committees, :special, :boolean, null: false, default: false, :after => :bureau_id
  end
end
