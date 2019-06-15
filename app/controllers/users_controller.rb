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
      flash[:first] = "Welcome, #{@user.username.capitalize}! Let's log some eats and drinks."
      redirect '/happy_hours'
    elsif User.find_by(username: params[:username])
      flash[:username] = "That username is taken. Please choose another."
      redirect '/signup'
    elsif params[:username].empty? || params[:password].empty? || params[:email].empty?
      flash[:empty] = "Please enter a username, password, AND email."
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
    if params[:username].empty? || params[:password].empty?
      flash[:login] = "Please enter a valid username AND password."
      redirect '/login'
    else
      user = User.find_by(username: params[:username])
      if user
        if user.authenticate(params[:password])
          session[:user_id] = user.id
          flash[:welcome] = "Welcome back! Whatcha been eatin' and drinkin'?"
          redirect '/happy_hours'
        else
          flash[:password] = "Password incorrect. Please try again."
          redirect '/login'
        end
      else
        flash[:not_found] = "Username not found. Please try again."
        redirect '/login'
      end
    end
  end

  get '/logout' do
    session.clear
    flash[:logged_out] = "You have successfully logged out!"
    redirect '/login'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end

end
