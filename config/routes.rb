Rails.application.routes.draw do

  get 'friends/show'
  get '/main' => 'main#top'
  get '/' => 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "users/:id/update" => "users#update"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  post "groups/create" => "groups#create"
  get "register" => "groups#new"

  resources :users, :groups, :friends


end

