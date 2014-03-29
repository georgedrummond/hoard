Hoard::Application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new', as: 'login'

  resources :rubygems

  root to: redirect('/rubygems')
end
