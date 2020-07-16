Rails.application.routes.draw do
  root 'sessions#index'

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
  
  resources :trainings
  resources :workouts do 
    resources :trainings, shallow: true
    end
  resources :events do 
    resources :trainings, shallow: true
    end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
