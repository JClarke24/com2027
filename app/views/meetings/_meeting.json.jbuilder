json.extract! meeting, :id, :title, :description, :tutor_id, :student_id, :location, :startDateTime, :endDateTime, :student_accepted, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
