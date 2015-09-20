json.array!(@owners) do |owner|
  json.extract! owner, :id, :ofname, :omname, :olname, :opnumber, :oemail, :ocity, :ozip, :ostate_id
  json.url owner_url(owner, format: :json)
end
