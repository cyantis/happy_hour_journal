class Location < ActiveRecord::Base
  has_many :happy_hours, through: :users
end
