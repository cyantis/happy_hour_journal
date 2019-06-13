class User < ActiveRecord::Base
  has_many :happy_hours
  has_secure_password
end
