json.array!(@userfiles) do |userfile|
  json.extract! userfile, :id, :filename, :meeting_id
  json.url userfile_url(userfile, format: :json)
end
