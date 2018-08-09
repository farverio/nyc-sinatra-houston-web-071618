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
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    
    erb :'figures/show' 
  end
  
  post '/figures' do
    
    if !!params[:figure][:name]
      @figure = Figure.create(params["figure"])
      
      FigureTitle
      
      if !!params[:landmark]
        @figure.landmarks << Landmark.create(params[:landmark])
      end
      
      if !!params[:title]
        @figure.titles << Title.create(params[:title])
      end
    end
      
    redirect "/figures/#{@figure.id}"
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    
    erb :'figures/edit'
  end
  
  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    
    @figure.update(params["figure"])
    
    redirect "/figures/#{@figure.id}"
  end 
end