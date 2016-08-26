Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"

  get '/signup' => "users#new"
  post '/users' => "users#create"
  get '/users/:id' => "users#show"
  get '/users/:id/edit' => "users#edit"
  patch '/users/:id' => "users#update"
end
