class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :message
      t.datetime :init_date
      t.datetime :end_date
      t.integer :proximity_trigger_range
      t.belongs_to :store, index: true
      t.belongs_to :beacon, index: true

      t.timestamps
    end
  end
end
