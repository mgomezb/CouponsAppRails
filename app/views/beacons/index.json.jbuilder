json.array!(@beacons) do |beacon|
  json.extract! beacon, :id, :major, :minor, :proximity_uuid, :description, :local_id
  json.url beacon_url(beacon, format: :json)
end
