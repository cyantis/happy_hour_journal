class HappyHoursController < ApplicationController

  get '/happy_hours' do
   if logged_in?
     @hh = HappyHour.all
     erb :'/happy_hours/happy_hours'
   else
     redirect to '/login'
   end
 end

 post '/tweets' do
    if params[:happy_hour][:location].empty? || params[:happy_hour][:date].empty?
      redirect '/happy_hours/new'
    else
      user = current_user
      hh = HappyHour.create(params[:happy_hour])
      user.happy_hours << hh
      #location = hh.location_id
      #location.happy_hours << hh
      redirect "/happy_hours/#{user.happy_hours.last.id}"
    end
  end

  get '/happy_hours/new' do
    if logged_in?
      erb :'/happy_hours/new'
    else
      redirect '/login'
    end
  end

  patch '/happy_hours/:id/edit' do
    redirect "/happy_hours/#{params[:id]}/edit" if params[:happy_hour][:location].empty? || params[:happy_hour][:date].empty?
    hh = HappyHour.find(params[:id])
    hh.update(params[:happy_hour])
    redirect "/happy_hours/#{happy_hour.id}"
  end

  delete '/happy_hours/:id/delete' do
    redirect '/happy_hours' if !logged_in?
    @hh = HappyHour.find(params[:id])
    if current_user.happy_hours.include?(@hh)
      HappyHour.find(params[:id]).destroy
      erb :'/happy_hour/edit_happy_hour'
    end
      redirect '/happy_hours'
  end

  get '/happy_hours/:id/edit' do
    redirect '/login' if !logged_in?
    @hh = HappyHour.find(params[:id])
    if current_user.happy_hours.include?(@hh)
      erb :'/happy_hours/edit_happy_hour'
    else
      redirect '/happy_hours'
    end
  end

  get '/happy_hours/:id' do
    redirect '/login' if !logged_in?
    @hh = HappyHour.find(params[:id])
    erb :'/happy_hours/show_happy_hour'
  end
end
