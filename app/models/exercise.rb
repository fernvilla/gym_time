class Exercise
  include Mongoid::Document

  has_and_belongs_to_many :workouts

  field :name, type: String

  validates :name, presence: true
end
