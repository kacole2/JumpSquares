json.array!(@apptype_requests) do |apptype_request|
  json.extract! apptype_request, :appname, :imageurl, :apprequestor, :completed
  json.url apptype_request_url(apptype_request, format: :json)
end
