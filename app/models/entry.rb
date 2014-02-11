class Entry
  include Mongoid::Document

  belongs_to :user
  
  field :title, type: String
  field :entry_date, type: String
  field :content, type: String

  validates :title, :presence => true
  validates :entry_date, :presence => true
  validates :content, :presence => true
end
