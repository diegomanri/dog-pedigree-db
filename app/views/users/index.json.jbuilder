json.array!(@users) do |user|
  json.extract! user, :id, :ufname, :umname, :ulname, :uemail, :username, :password_digest, :role
  json.url user_url(user, format: :json)
end
