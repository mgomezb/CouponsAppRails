class CreateDateUpdates < ActiveRecord::Migration
  def change
    create_table :date_updates do |t|

      t.timestamps
    end
  end
end
