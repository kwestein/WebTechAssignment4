WebTechAssignment4::Application.routes.draw do
  root 'home#index'

  resources :bands do 
  	get :search_names, :on => :collection
    post :search_names, :on => :collection
  end

  resources :genres
  resources :artists
  resources :locations
  resources :shows
  resources :albums
end
