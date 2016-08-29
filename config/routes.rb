Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"

  get '/signup' => "users#new", as: "new_user"
  post '/users' => "users#create"
  get '/users/:id' => "users#show", as: "user"
  get '/login' => "sessions#new", as: "login"
  get '/logout' => "sessions#destroy"
  post '/sessions' => "sessions#create"
  get '/users/:id/edit' => "users#edit", as: "edit_user"
  patch '/users/:id' => "users#update"

  get '/articles', to: "articles#index", as: "articles"
  get '/articles/new', to: "articles#new", as: "new_article"
  post '/articles', to: "articles#create"
  get "/articles/:article_id", to: "articles#show", as: "show_article"
  get '/articles/:article_id/edit', to: 'articles#edit', as: "edit_article"
  patch '/articles/:article_id', to: "articles#update", as: "update_article"
  delete '/articles/:article_id', to: "articles#destroy"

  get '/articles/:article_id/comments/new', to: "comments#new", as: "article_comments"
  post '/articles/:article_id/comments', to: "comments#create", as: "post_comment"
  get '/articles/:article_id/comments/:id/edit', to: "comments#edit", as: "edit_comment"
  patch '/articles/:article_id/comments/:id', to: "comments#update", as: "update_comment"

  get "*unmatched_route", to: "application#not_found"
end
