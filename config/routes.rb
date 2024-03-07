Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/users" => "users#index"
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  post "/sessions" => "sessions#create"

  get "/brackets" => "brackets#index"
  post "/brackets" => "brackets#create"
  get "/brackets/:id" => "brackets#show"
  patch "/brackets/:id" => "brackets#update"
  delete "/brackets/:id" => "brackets#destroy"

  get "/teams" => "teams#index"
  post "/teams" => "teams#create"
  get "/teams/:id" => "teams#show"
  patch "/teams/:id" => "teams#update"
  delete "/teams/:id" => "teams#destroy"

  get "/games" => "games#index"
  post "/games" => "games#create"
  get "/games/:id" => "games#show"
  patch "/games/:id" => "games#update"
  delete "/games/:id" => "games#destroy"

  get "/matches" => "matches#index"
  post "/matches" => "matches#create"
  get "/matches/:id" => "matches#show"
  patch "/matches/:id" => "matches#update"
  delete "/matches/:id" => "matches#destroy"

  # filtered matched by bracket_id
  get "filter_by_bracket/:bracket_id" => "matches#filter_by_bracket"

  get "/groups" => "groups#index"
  post "/groups" => "groups#create"
  get "/groups/:id" => "groups#show"
  patch "/groups/:id" => "groups#update"
  delete "/groups/:id" => "groups#destroy"

  get "/group_brackets" => "group_brackets#index"
  post "/group_brackets" => "group_brackets#create"
  get "/group_brackets/:id" => "group_brackets#show"
  patch "/group_brackets/:id" => "group_brackets#update"
  delete "/group_brackets/:id" => "group_brackets#destroy"
end
