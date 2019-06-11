class TrailsController < ApplicationController

  get "/trips" do
    erb :"/trips/index.html"
  end

  get "/trips/new" do
    erb :"/trips/new.html"
  end

  post "/trips" do
    redirect "/trips"
  end

  get "/trips/:id" do
    erb :"/trips/show.html"
  end

  get "/trips/:id/edit" do
    erb :"/trips/edit.html"
  end

  patch "/trips/:id" do
    redirect "/trips/:id"
  end

  delete "/trips/:id/delete" do
    redirect "/trips"
  end
end
