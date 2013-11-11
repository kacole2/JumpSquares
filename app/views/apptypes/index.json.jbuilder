json.array!(@apptypes) do |apptype|
  json.extract! apptype, :name, :image
  json.url apptype_url(apptype, format: :json)
end
