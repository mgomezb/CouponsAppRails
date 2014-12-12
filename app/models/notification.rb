class Notification < ActiveRecord::Base
  belongs_to :store
  belongs_to :beacon

  has_many :beacon_notifications
  has_many :beacons, through: :beacon_notifications
end
