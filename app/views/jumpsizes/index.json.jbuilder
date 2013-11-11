json.array!(@jumpsizes) do |jumpsize|
  json.extract! jumpsize, :size, :length1, :length2
  json.url jumpsize_url(jumpsize, format: :json)
end
