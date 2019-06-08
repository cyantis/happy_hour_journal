require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "totalsecret"
  end

  get '/' do
    "HELLO WORLD."
  end

  helpers do
   def current_user
     @user = User.find_by_id(session[:user_id])
   end

   def logged_in?
     !!session[:user_id]
   end

   def logout
     session.clear
     redirect 'logout'
   end
 end

end