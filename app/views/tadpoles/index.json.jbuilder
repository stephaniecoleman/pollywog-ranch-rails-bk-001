json.array!(@tadpoles) do |tadpole|
  json.extract! tadpole, :name, :color, :frog_id
  json.url tadpole_url(tadpole, format: :json)
end