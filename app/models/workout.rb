class Workout
  include Mongoid::Document
  field :body_part, type: String
  field :exercise, type: String
  field :workout_date, type: String
end
