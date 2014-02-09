require 'bcrypt'

class User
	include Mongoid::Document
	attr_accessor :password

  field :username, type: String
  field :salt, type: String
  field :hashed_password, type: String

  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
  
  def authenticated? pwd
  	self.hashed_password == BCrypt::Engine.hash_secret(pwd, self.salt)
  end

  before_save :hash_stuff

  private
  def hash_stuff
  	self.salt = BCrypt::Engine.generate_salt
  	self.hashed_password = BCrypt::Engine.hash_secret self.password, self.salt
  	self.password = nil
  end
end
