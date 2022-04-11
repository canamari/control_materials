Rails.application.routes.draw do
  root 'users#new'
  
  resources :materials do
    resources :material_logs
  end
  resources :users
  get  '/login'  => 'sessions#login'
  post '/login'  => 'sessions#new'
  get  '/logout'   => 'sessions#destroy'
  post '/logout'   => 'sessions#destroy'
end
