json.array!(@frogs) do |frog|
  json.extract! frog, :name, :color, :pond_id
  json.url frog_url(frog, format: :json)
end