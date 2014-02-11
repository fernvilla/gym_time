class Workout
  include Mongoid::Document

  belongs_to :user
  has_and_belongs_to_many :exercises
  
  field :body_part, type: String
  field :exercise, type: String
  field :workout_date, type: String

  validates :body_part, :presence => true
  validates :exercise, :presence => true
  validates :workout_date, :presence => true
end
