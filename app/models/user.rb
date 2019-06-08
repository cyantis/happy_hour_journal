class User < ActiveRecord::Base
  has_many :happy_hours, through: :locations
  has_secure_password
end
