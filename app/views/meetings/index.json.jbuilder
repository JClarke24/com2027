# json.array! @meetings, partial: "meetings/meeting", as: :meeting
json.array! (@meetings) do |meeting|
  json.extract! meeting, :id, :title, :description
  json.start meeting.startDateTime
  json.end meeting.endDateTime
  json.url meeting_url(meeting, format: :html)
end
