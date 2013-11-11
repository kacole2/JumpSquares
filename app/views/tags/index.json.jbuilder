json.array!(@tags) do |tag|
  json.extract! tag, :tagname
  json.url tag_url(tag, format: :json)
end
