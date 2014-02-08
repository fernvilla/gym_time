json.array!(@workouts) do |workout|
  json.extract! workout, :body_part, :workout_date
  json.set!(:title, workout.body_part)
  json.set!(:start, workout.workout_date)
  json.url workout_url(workout, format: :html)
end
