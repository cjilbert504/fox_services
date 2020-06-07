Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/auth/google_oauth2/callback', to: 'sessions#omni'
  get '/search', to: 'tasks#search'
  get 'login', to: 'sessions#new'
  get 'signup', to: 'employees#new'

  resources :contact_messages, only: [:new, :create]

  resources :lists do
    resources :tasks, only: [:index, :show, :new]
  end
  
  resources :employees, except: [:new] do 
    resources :tasks, only: [:index]
  end

  resources :tasks, only: [:index, :edit, :create, :update, :destroy]

  resources :sessions, only: [:create, :destroy]

end