class BeaconNotification < ActiveRecord::Base
	self.table_name = 'beacons_notifications'
	belongs_to :beacon
  	belongs_to :notification

  	validates_uniqueness_of :beacon_id, scope: :notification_id
end