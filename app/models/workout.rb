class Workout
  include Mongoid::Document

  belongs_to :user
  has_many :entries
  
  field :body_part, type: String
  field :exercise, type: String
  field :workout_date, type: String
end
