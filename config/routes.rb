Rails.application.routes.draw do
  namespace :api do
    post 'authentication', to: 'authentication#create'
  end
end
