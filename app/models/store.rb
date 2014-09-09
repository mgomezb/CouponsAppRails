class Store < ActiveRecord::Base
  belongs_to :local, through: :local_stores

  has_many :coupons
  has_many :notifications
end
