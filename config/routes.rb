Rails.application.routes.draw do

  get 'main/' => 'main#top'
  get '/' => 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "users/create" => "users#create"
  get "signup" => "users#new"
end

