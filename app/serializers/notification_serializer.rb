class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :title, :message, :init_date, :end_date, :proximity_trigger_range
  has_one :store
  has_one :beacon
end
