json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :email, :password, :password_digest
  json.url organization_url(organization, format: :json)
end
