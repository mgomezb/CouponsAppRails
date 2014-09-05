class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.belongs_to :local, index: true

      t.timestamps
    end
  end
end
