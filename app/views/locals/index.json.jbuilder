json.array!(@locals) do |local|
  json.extract! local, :id, :name, :latitude, :longitude, :radius, :address
  json.url local_url(local, format: :json)
end
