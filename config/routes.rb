WebTechAssignment4::Application.routes.draw do
  root 'home#index'

  resources :bands
  resources :genres
  resources :artists
  resources :locations
  resources :shows
  resources :albums
end
