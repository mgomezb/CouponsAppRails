class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.integer :major
      t.integer :minor
      t.string :proximity_uuid
      t.string :description
      t.belongs_to :local, index: true

      t.timestamps
    end
  end
end
