class Workout
  include Mongoid::Document
  field :body_part, type: String
  field :exercise, type: String
  field :workout_date, type: String

  validates :body_part, presence: true
  validates :exercise, presence: true
  validates :workout_date, presence: true
end
