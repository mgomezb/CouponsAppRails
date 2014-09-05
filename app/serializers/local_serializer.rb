class LocalSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude, :radius, :address
end
