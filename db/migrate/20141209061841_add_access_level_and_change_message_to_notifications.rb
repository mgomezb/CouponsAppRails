class AddAccessLevelAndChangeMessageToNotifications < ActiveRecord::Migration
  def change
  	add_column :notifications, :access_level, :string
  	change_column :notifications, :message, :text
  end
end
