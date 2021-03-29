Rails.application.routes.draw do
  
  
  root "static_pages#home"
  get 'static_pages/home'
  get '/signup',              to: 'users#new'
  get "/login",               to:  "sessions#new"
  post "/login",              to:  "sessions#create"  
  delete "/logout",           to:  "sessions#destroy"
  get   "/external",          to:  "users#external_activities"
  get    "/activitiesg", to:  "users#group_activities"
  resources :users
  resources :groups
  resources :activities
            
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
