class Entry
  include Mongoid::Document
  field :title, type: String
  field :entry_date, type: String
  field :content, type: String
end
