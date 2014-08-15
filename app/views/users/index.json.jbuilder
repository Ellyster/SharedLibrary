json.array!(@users) do |user|
  json.extract! user, :id, :name, :username, :email, :encrypted_password, :salt, :avatar, :librarian, :admin
  json.url user_url(user, format: :json)
end
