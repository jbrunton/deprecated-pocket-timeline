json.array!(@timelines) do |timeline|
  json.extract! timeline, :id, :title, :description
  json.url timeline_url(timeline, format: :json)
end
