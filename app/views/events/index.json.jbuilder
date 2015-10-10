json.array!(@events) do |event|
  json.extract! event, :id, :ename, :edate, :etime, :edescription, :estateprov, :ecity, :ezippostal, :ecountry
  json.url event_url(event, format: :json)
end
