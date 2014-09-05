class BeaconSerializer < ActiveModel::Serializer
  attributes :id, :major, :minor, :proximity_uuid, :description
  has_one :local
end
