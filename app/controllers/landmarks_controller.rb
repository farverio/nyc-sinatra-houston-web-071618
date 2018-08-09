class LandmarksController < ApplicationController
  get '/landmarks' do
    erb :index
  end
  
  get '/landmarks/new' do
    erb :new
  end
  
  get 'landmarks/:id' do
    erb :show 
  end
  
  post '/landmarks' do
    new_landmark = Landmark.create(params)
    
    redirect "/landmarks/#{new_landmark.id}"
  end
  
  get 'landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    
    erb :edit
  end
  
  patch 'landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    
    @landmark.update(params[:name], params[:year_completed], params[:figure_id])
  end 
end
