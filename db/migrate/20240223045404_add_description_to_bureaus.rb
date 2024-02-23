class AddDescriptionToBureaus < ActiveRecord::Migration[7.0]
  def change
    add_column :bureaus, :description, :string, null: false, default: ""
  end
end
