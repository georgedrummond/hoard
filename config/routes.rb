Hoard::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :rubygems, only: [:create]
    end
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login',  to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/setup',  to: 'pages#setup', as: 'setup'

  resource  :setup
  resources :rubygems
  resources :sessions, only: [:create]

  root to: redirect('/rubygems')
end
