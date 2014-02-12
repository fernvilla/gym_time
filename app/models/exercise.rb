class Exercise
  include Mongoid::Document

  has_and_belongs_to_many :workouts
  belongs_to :user

  field :name, type: String
  field :link, type: String
  field :video, type: String

  validates :name, presence: true
end
