Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'

  resources :contact_messages, only: [:new, :create]

  resources :lists do
    resources :tasks, only: [:index, :show, :new, :create]
  end

  resources :tasks, only: [:edit, :update, :destroy]

  resources :employees

end
