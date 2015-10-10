json.array!(@dogs) do |dog|
  json.extract! dog, :id, :dname, :breed, :variety, :dob, :height, :weight, :pedinum, :occupation, :workcert, :health, :dcomments, :avatar, :user_id
  json.url dog_url(dog, format: :json)
end
