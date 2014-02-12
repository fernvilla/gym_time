class Entry
  include Mongoid::Document

  belongs_to :user
  belongs_to :workout
  
  field :title, type: String
  field :entry_date, type: String
  field :content, type: String
  field :exercise, type: String
  field :exercise_two, type: String
  field :exercise_three, type: String
  field :sets, type: Integer
  field :sets_two, type: Integer
  field :sets_three, type: Integer
  field :reps, type: Integer
  field :reps_two, type: Integer
  field :reps_three, type: Integer
  field :lbs, type: String
  field :lbs_two, type: String
  field :lbs_three, type: String


  validates :title, :presence => true
  validates :entry_date, :presence => true
  validates :content, :presence => true
end
