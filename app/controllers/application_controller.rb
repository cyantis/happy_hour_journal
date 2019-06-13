require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  set :session_secret, "totalsecret"
  use Rack::Flash

  get '/' do
    if logged_in?
      redirect '/happy_hours'
    else
      erb :index
    end
  end

  helpers do

   def current_user
     @user = User.find_by_id(session[:user_id])
   end

   def logged_in?
     !!session[:user_id]
   end
  end

end
