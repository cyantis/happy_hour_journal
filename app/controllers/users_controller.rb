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

  post '/login' do
    if !params[:username].empty? && !params[:password].empty?
      user = User.find_by(username: params[:username])
      if user
        if user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect '/happy_hours'
        end
      end
    end
    redirect '/login'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end
end
