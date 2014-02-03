Shoeapp::Application.routes.draw do
  resources :sessions, :users, :shoes
  get '/signup' => 'users#new' 

  root to: 'sessions#new'

  #non-restful routes for my nav bar
  get '/signup' => 'users#new'
  delete '/signout', to: 'sessions#destroy'
  get'/signin' => 'sessions#new'


 
end
