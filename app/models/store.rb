class Store < ActiveRecord::Base
  belongs_to :local

  has_many :coupons
end
