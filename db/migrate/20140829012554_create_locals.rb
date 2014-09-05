class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.integer :radius
      t.string :address

      t.timestamps
    end
  end
end
