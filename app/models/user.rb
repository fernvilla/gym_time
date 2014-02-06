class User
  include Mongoid::Document
  field :username, type: String
  field :salt, type: String
  field :hashed_password, type: String
end
