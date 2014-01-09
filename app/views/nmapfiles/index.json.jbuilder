json.array!(@nmapfiles) do |nmapfile|
  json.extract! nmapfile, :nmapfilename, :nmapfilerecords, :nmapfilematches
  json.url nmapfile_url(nmapfile, format: :json)
end
