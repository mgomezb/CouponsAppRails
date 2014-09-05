class Coupon < ActiveRecord::Base
  belongs_to :store
  belongs_to :beacon
end
