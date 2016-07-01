class FiguresController < ApplicationController

  get '/figures/new' do 
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do 
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.create(params[:title])
    @figure.landmarks << Landmark.create(params[:landmark])
  end

  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all 
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do 
        @figure = Figure.find(params[:id])
        @figure.update(name: params[:figure][:name])
        title = Title.find_or_create_by(params[:title])
        landmark = Landmark.find_or_create_by(params[:landmark])
        @figure.landmarks << landmark
        @figure.titles << title 
    # redirect "/figures/#{params[:id]}"
    erb :'/figures/show'
  end

end
