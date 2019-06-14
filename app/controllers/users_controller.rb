class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/users/create_user'
    else
      redirect '/happy_hours'
    end
  end

  post '/signup' do
    if !params[:username].empty? && !params[:password].empty? && !params[:email].empty? && !logged_in? && !User.find_by(username: params[:username])
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect '/happy_hours'
    elsif User.find_by(username: params[:username])
      flash[:username] = "That username is taken. Please choose another. Thanks!"
      redirect '/signup'
    elsif params[:username].empty? || params[:password].empty? || params[:email].empty?
      flash[:empty] = "Please enter a username, password, AND email. Thanks!"
      redirect '/signup'
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

  get '/logout' do
    session.clear
    redirect '/login'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end

end
