Rails.application.routes.draw do
  root to: 'rooms#show'

  # url for callback
  devise_for :users

  get 'friends/show'
  get '/main' => 'main#top'
  get '/' => 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "users/:id/update" => "users#update"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  post "groups/create" => "groups#create"
  get "register" => "groups#new"
  get "users/search" => "users#search"
  post "friends/:user_id/create" => "friends#create"
  post "friends/:user_id/destroy" => "friends#destroy"
  get "users/:id/friends" => "users#friends"

  resources :users, :only => [:index, :show, :edit]
  resources :groups, :friends, :rooms
  mount ActionCable.server => '/cable'

end

