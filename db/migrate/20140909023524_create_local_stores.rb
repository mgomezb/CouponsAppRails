class CreateLocalStores < ActiveRecord::Migration
  def change
    create_table :local_stores do |t|
      t.integer :local_id
      t.integer :store_id

      t.timestamps
    end
  end
end
