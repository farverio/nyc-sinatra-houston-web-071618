class FiguresController < ApplicationController
  get '/figures' do
    @all_figures = Figure.all
    
    erb :'figures/index'
  end
  
  get '/figures/new' do
    @all_titles = Title.all
    @all_landmarks = Landmark.all
    
    erb :'figures/new'
  end
  
  get 'figures/:id' do
    erb :show 
  end
  
  post '/figures' do
    binding.pry
    new_figure = Figure.create(params)
    FigureTitle.create(params)
    
    redirect "/figures/#{new_figure.id}"
  end
  
  get 'figures/:id/edit' do
    @figure = Figure.find(params[:id])
    
    erb :edit
  end
  
  patch 'figures/:id' do
    @figure = Figure.find(params[:id])
    
    @figure.update(params[:name], params[:year_completed], params[:figure_id])
  end 
end