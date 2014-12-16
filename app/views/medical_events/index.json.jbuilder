json.array!(@medical_events) do |medical_event|
  json.extract! medical_event, :id, :summary, :description, :occurred_at, :user_id
  json.url medical_event_url(medical_event, format: :json)
end
