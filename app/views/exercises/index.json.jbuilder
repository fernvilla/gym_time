json.array!(@exercises) do |exercise|
  json.extract! exercise, :name, :link, :video
  json.url exercise_url(exercise, format: :html)
end