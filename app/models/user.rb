class User < ActiveRecord::Base
  has_secure_password
  has_many :happy_hour, through :location
end
