Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :user_times

  get '/login' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'users#destroy'
end
