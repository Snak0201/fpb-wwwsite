class CreateApiDiceLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :api_dice_logs do |t|

      t.timestamps
    end
  end
end
