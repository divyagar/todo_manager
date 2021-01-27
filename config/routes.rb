Rails.application.routes.draw do
  # get "todos", to: "todos#index"
  # post "todos/create", to: "todos#create"
  # get "todos/:id", to: "todos#show"

  get "/" => "home#index"

  get "users/login", to: "users#login"
  resources :todos, :users
end