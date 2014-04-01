json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :meeting
  json.url meeting_url(meeting, format: :json)
end
