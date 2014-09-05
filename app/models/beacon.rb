class Beacon < ActiveRecord::Base
  belongs_to :local

  has_many :coupons
  has_many :notifications
end
