class DeleteStoreAndAddLocalFromNotification < ActiveRecord::Migration
  def change
  	remove_column :notifications , :store_id, :integer
  	add_column :notifications, :local_id, :integer
  end
end
