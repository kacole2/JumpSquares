json.array!(@jumpsquares) do |jumpsquare|
  json.extract! jumpsquare, :name, :apptype, :url, :ipordns, :description
  json.url jumpsquare_url(jumpsquare, format: :json)
end
