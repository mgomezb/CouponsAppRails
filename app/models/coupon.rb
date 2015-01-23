class Coupon < ActiveRecord::Base
  belongs_to :store
  belongs_to :beacon

  validate :valid_time_range

  has_many :user_coupons
  has_many :beacon_coupons
  has_many :users, through: :user_coupons
  has_many :beacons, through: :beacon_coupons

  def valid_time_range
  	if self.init_date.present? && self.end_date.present? && self.init_date > self.end_date
  		self.errors.add :end_date , 'Debe ser mayor o igual a la fecha de inicio'
  	end
  end

  has_attached_file :image,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {environment: ENV["RACK_ENV"]},
    :styles => {:thumb => "x600"}

  validates_attachment :image, presence: true, content_type: { content_type: ["image/png", "image/jpg", "image/jpeg", "image/bmp"] }
end
