Rails.application.routes.draw do
  get 'trainers/index' => "trainers#index"
  get "trainers/signup" => "trainers#new"
  get "trainers/:id" => "trainers#show"
  post "trainers/create" => "trainers#create"
  get "trainers/:id/edit" => "trainers#edit"
  post "trainers/:id/update" =>"trainers#update"
  get "trainers/login" => "trainers#login_form"
  post "trainers/login" => "trainers#login"
  post "trainers/logout" => "trainers#logout"
  
  get 'users/index' => "users#index"
  get "signup" => "users#new"
  get "users/:id" => "users#show"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  get "/" => "home#top"
  get "about" => "home#about"
end
