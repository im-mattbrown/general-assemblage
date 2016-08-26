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

  get '/articles', to: "articles#index", as: "articles"
  get '/articles/new', to: "articles#new", as: "new_article"
  # post "/cities/:city_id/posts", to: "city_posts#create", as: "new_city_post"
  # get "/cities/:city_id/posts/:post_id", to: "posts#show", as: "post"
  # get "/cities/:city_id/posts/:post_id/edit", to: "posts#edit", as: "edit_post"
  # patch "/cities/:city_id/posts/:post_id", to: "posts#update", as: "update_post"
  # delete "/cities/:city_id/posts/:post_id", to: "posts#destroy"
  #
  # get "*unmatched_route", to: "application#not_found"
end
