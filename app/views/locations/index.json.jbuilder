json.array!(@locations) do |location|
  json.extract! location, :id, :address, :state, :zipcode, :city, :organization
  json.url location_url(location, format: :json)
end
