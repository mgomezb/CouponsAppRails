class Coupon < ActiveRecord::Base
  belongs_to :store
  belongs_to :beacon

  validate :valid_time_range

  def valid_time_range
  	if self.init_date.present? && self.end_date && self.init_date > self.end_date
  		self.errors.add :end_date , 'Debe ser mayor o igual a la fecha de inicio'
  	end
  end

  has_attached_file :image

  validates_attachment :image, presence: true, content_type: { content_type: ["image/png", "image/jpg", "image/jpeg", "image/bmp"] }
end
