Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'

  resources :contact_messages, only: [:new, :create]

  resources :lists do
    resources :tasks, only: [:index, :show, :new, :create]
  end

  resources :tasks, only: [:edit, :update, :destroy]

  resources :employees do 
    resources :tasks, only: [:index]
  end
  resources :sessions, only: [:new, :create, :destroy]

end


# employee_tasks GET    /employees/:employee_id/tasks(.:format)                                                  tasks#index
# list_tasks GET    /lists/:list_id/tasks(.:format)                                                          tasks#index