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
end
