Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"

  get '/signup' => "users#new", as: "new_user"
  post '/users' => "users#create"
  get '/users/:id' => "users#show", as: "user"
  get '/login' => "sessions#new", as: "new_session"
  get '/logout' => "sessions#destroy"
  post '/sessions' => "sessions#create"
  get '/users/:id/edit' => "users#edit", as: "edit_user"
  patch '/users/:id' => "users#update"
end
