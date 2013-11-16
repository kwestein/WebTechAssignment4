WebTechAssignment4::Application.routes.draw do
  root 'home#index'

  resources :bands do 
  	get :search_names, :on => :collection
    post :search_names, :on => :collection
    get :search_genres, :on => :collection
    post :search_genres, :on => :collection
    get :search_albums, :on => :collection
    post :search_albums, :on => :collection
  end

  resources :genres
  resources :artists
  resources :locations
  resources :shows
  resources :albums
  resources :songs, only: [:destroy]
end
