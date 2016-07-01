class LandmarksController < ApplicationController

  get '/landmarks/new' do 
    @titles = Title.all
    @figures = Figure.all
    erb :'/landmarks/new'
  end

  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
    @landmark.figures << Figure.create(params[:figure])
  end

  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end


  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
        @landmark = Landmark.find(params[:id])
        @landmark.update(name: params[:landmark][:name])
        @landmark.update(year_completed: params[:landmark][:year_completed])
        @landmark.figures << params[:figure]
    # redirect "/figures/#{params[:id]}"
    erb :'/landmarks/show'
  end

end
