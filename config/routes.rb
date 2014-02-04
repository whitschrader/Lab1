Shoeapp::Application.routes.draw do
  #get 'users/:id/' => 'users#search', as: :search
  resources :sessions, :users, :shoes

  get '/search' => 'shoes#search', as: :search
  post '/get_results' => 'shoes#get_results', as: :get_results

  get '/signup' => 'users#new' 

  root to: 'sessions#new'

  #non-restful routes for my nav bar
  get '/signup' => 'users#new'
  delete '/signout', to: 'sessions#destroy'
  get'/signin' => 'sessions#new'
  


 
end
