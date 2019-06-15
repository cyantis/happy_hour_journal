class HappyHoursController < ApplicationController

  get '/happy_hours' do
   if logged_in?
     @user = current_user
     @hh = HappyHour.all
     erb :'/users/show'
   else
     redirect to '/login'
   end
 end

 post '/happy_hours' do
    if params[:date].empty? || params[:locale].empty?
      flash[:hh_empty] = "Please include at least a location AND date."
      redirect '/happy_hours/new'
    else
      user = current_user
      hh = HappyHour.create(params)
      user.happy_hours << hh
      location = Location.find_or_create_by(name: hh.locale.downcase)
      location.happy_hours << hh
      flash[:hh] = "Happy Hour logged!"
      redirect "/happy_hours/#{user.happy_hours.last.id}"
    end
  end

  get '/happy_hours/new' do
    if logged_in?
      @user = current_user
      erb :'/happy_hours/new'
    else
      redirect '/login'
    end
  end

  get '/happy_hours/:id/edit' do
    redirect '/login' if !logged_in?
    @user = current_user
    @hh = HappyHour.find(params[:id])
    if current_user.happy_hours.include?(@hh)
      erb :'/happy_hours/edit_happy_hour'
    else
      redirect '/happy_hours'
    end
  end

  patch '/happy_hours/:id/edit' do
    @hh = HappyHour.find(params[:id])
      params[:hh].each do |k, v|
        if !v.empty?
          @hh.update(k => v)
        end
      end
    flash[:hh_edit] = "Happy Hour updated!"
    redirect "/happy_hours/#{@hh.id}"
  end

  delete '/happy_hours/:id/delete' do
    redirect '/happy_hours' if !logged_in?
    @hh = HappyHour.find(params[:id])
    if current_user.happy_hours.include?(@hh)
      HappyHour.find(params[:id]).destroy
      flash[:delete] = "Happy Hour deleted!"
      redirect '/happy_hours'
    end
      redirect '/happy_hours'
  end

  get '/happy_hours/:id' do
    redirect '/login' if !logged_in?
    @hh = HappyHour.find(params[:id])
    erb :'/happy_hours/show_happy_hour'
  end
end
