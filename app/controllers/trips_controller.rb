class TripsController < ApplicationController

  get "/trips" do
    @trips = Trip.all
    erb :"/trips/index.html"
  end

  get "/trips/new" do
    @trails = Trail.all
    erb :"/trips/new.html"
  end

  post "/trips" do
    @trip = Trip.new(params)
    @trip.user = User.find_by_id(session[:user_id])
    @trip.save

    redirect "/trips"
  end

  get "/trips/:id" do
    @trip = Trip.find_by_id(params[:id])
    erb :"/trips/show.html"
  end

  get "/trips/:id/edit" do
    @trip = Trip.find_by_id(params[:id])
    @trails = Trail.all
    erb :"/trips/edit.html"
  end

  patch "/trips/:id" do
    @trip = Trip.find_by_id(params[:id])
    @trip.trail = Trail.find_by_id(params[:trail_id])
    @trip.name = params[:name]
    @trip.year = params[:year]
    @trip.month = params[:month]
    @trip.day = params[:day]
    @trip.notes = params[:notes]
    @trip.save

    erb :"/trips/show.html"
  end

  delete "/trips/:id/delete" do
    @trip = Trip.find_by_id(params[:id])
    @trip.delete
    redirect "/trips"
  end
end
