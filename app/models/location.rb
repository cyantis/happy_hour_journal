class Location < ActiveRecord::Base
  has_many :happy_hour, through :user
end
