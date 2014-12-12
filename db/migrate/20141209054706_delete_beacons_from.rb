class DeleteBeaconsFrom < ActiveRecord::Migration
  def change
  	remove_column :notifications , :beacon_id, :integer
  end
end
