Hoard::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :rubygems, only: [:create]
    end
  end


  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new', as: 'login'

  resources :rubygems
  resources :sessions, only: [:new, :create]

  root to: redirect('/rubygems')
end
