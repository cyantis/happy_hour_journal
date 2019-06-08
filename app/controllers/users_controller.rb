class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/users/create_user'
    else
      redirect '/happy_hours'
    end
  end

  post '/signup' do
    if !params[:username].empty? && !params[:password].empty? && !params[:email].empty? && !logged_in?
      user = User.create(params)
      session[:user_id] = user.id
      redirect '/happy_hours'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/happy_hours'
    else
      erb :'/users/login'
    end
  end
end
