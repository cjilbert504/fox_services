Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'

  resources :contact_messages, only: [:new, :create]

  namespace :admin do 
    resources :lists
  end

  resources :lists do
    resources :tasks, only: [:index, :show, :create]
  end
  
  resources :employees do 
    resources :tasks, only: [:index]
  end

  resources :tasks, only: [:edit, :update, :destroy]

  resources :sessions, only: [:new, :create, :destroy]

end