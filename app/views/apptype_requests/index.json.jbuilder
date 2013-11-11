json.array!(@apptype_requests) do |apptype_request|
  json.extract! apptype_request, 
  json.url apptype_request_url(apptype_request, format: :json)
end
