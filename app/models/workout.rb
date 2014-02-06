class Workout
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic # Necessary for date_select in form
  field :body_part, type: String
  field :exercise, type: String
  field :workout_date, type: Date
end
