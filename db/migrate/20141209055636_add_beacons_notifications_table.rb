class AddBeaconsNotificationsTable < ActiveRecord::Migration
  def change
  	create_table :beacons_notifications do |t|
  			t.integer :beacon_id
  			t.integer :notification_id
  		end
  end
end
