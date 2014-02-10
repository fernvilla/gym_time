class Entry
  include Mongoid::Document

  belongs_to :user
  belongs_to :workout
  
  field :title, type: String
  field :entry_date, type: String
  field :content, type: String
end
