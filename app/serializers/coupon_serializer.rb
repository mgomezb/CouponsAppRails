class CouponSerializer < ActiveModel::Serializer
  attributes :id, :title, :message, :init_date, :end_date, :access_level, :legal, :proximity_trigger_range, :image, :code
  has_one :store
  has_one :beacon
end
