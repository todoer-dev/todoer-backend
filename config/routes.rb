Rails.application.routes.draw do
  namespace :api do
    post 'authentication', to: 'authentication#create'

    resources :tasks
    resources :users, only: [:create]
  end
end
