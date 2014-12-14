class Notification < ActiveRecord::Base
  belongs_to :local

  has_many :beacon_notifications
  has_many :beacons, through: :beacon_notifications
end
