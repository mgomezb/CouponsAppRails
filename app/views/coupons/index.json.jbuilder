json.array!(@coupons) do |coupon|
  json.extract! coupon, :id, :title, :message, :init_date, :end_date, :access_level, :legal, :proximity_trigger_range, :image, :code, :store_id, :beacon_id
  json.url coupon_url(coupon, format: :json)
end
