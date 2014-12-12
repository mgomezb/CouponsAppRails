class Beacon < ActiveRecord::Base
  belongs_to :local

  has_many :beacon_coupons
  has_many :coupons,  through: :beacon_coupons

  has_many :beacon_notifications
  has_many :notifications,  through: :beacon_notifications
end
