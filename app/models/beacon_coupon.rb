class BeaconCoupon < ActiveRecord::Base
	self.table_name = 'beacons_coupons'
	belongs_to :beacon
  	belongs_to :coupon

  	validates_uniqueness_of :beacon_id, scope: :coupon_id
end