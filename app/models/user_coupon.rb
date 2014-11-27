class UserCoupon < ActiveRecord::Base
	self.table_name = 'users_coupons'
	belongs_to :user
  	belongs_to :coupon

  	validates_uniqueness_of :user_id, scope: :coupon_id
end