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
    new_figure = Figure.create(name: params[:figure])
    
    params[:title].each do |key_val_pair|
      if key_val_pair[0] == "name"
        FigureTitle.create(name: title_name, figure_id: new_figure.id)
      else
        FigureTitle.update(figure_id: new_figure.id)
      end
    end
      #need to fix stuff
      new_landmark = nil
      params[:landmark].each do |key_val_pair|
        if key_val_pair[0] == "name"
          new_landmark = Landmark.create(
          landmark_arr << key_val_pair[1]
        else
          landmark_arr << key_val_pair[0]
        end
      end
      
      landmark_arr.each do |landmark_name|
        FigureTitle.create(name: title_name, figure_id: new_figure.id)
      end
      
    end
    
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