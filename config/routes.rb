Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/auth/facebook/callback', to: 'sessions#omni'

  resources :contact_messages, only: [:new, :create]

  resources :lists do
    resources :tasks, only: [:index, :show, :new]
  end
  
  resources :employees do 
    resources :tasks, only: [:index]
  end

  resources :tasks, only: [:index, :edit, :create, :update, :destroy]

  resources :sessions, only: [:new, :create, :destroy]

end