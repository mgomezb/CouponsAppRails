class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :title
      t.string :message
      t.datetime :init_date
      t.datetime :end_date
      t.string :access_level
      t.string :legal
      t.integer :proximity_trigger_range
      t.string :image
      t.string :code
      t.belongs_to :store, index: true
      t.belongs_to :beacon, index: true

      t.timestamps
    end
  end
end
