Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #get "todos", to: "todos#index"
  # get "todos" , to: "todos#new"
  # post "todos" , to: "todos#create"
  # get "todos/:id", to: "todos#show"
  # get "todos/:id/edit" , to: "todos#edit"
  # put "todos/:id" , to: "todos#update"
  # delete "todos/:id" , to: "todos#destroy"
  get "/" => "home#index", as: :home
  resources :todos
  resources :users
  #get "sigin1", to: "sigin1#new"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
