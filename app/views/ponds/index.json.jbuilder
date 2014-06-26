json.array!(@ponds) do |pond|
  json.extract! pond, :name, :water_type
  json.url pond_url(pond, format: :json)
end