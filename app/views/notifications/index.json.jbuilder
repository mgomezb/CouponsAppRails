json.array!(@notifications) do |notification|
  json.extract! notification, :id, :title, :message, :init_date, :end_date, :proximity_trigger_range, :store_id, :beacon_id
  json.url notification_url(notification, format: :json)
end
