Rails.application.routes.draw do
<<<<<<< Updated upstream
=======
  root to: 'rooms#show'

  # url for callback
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # for logout
  # devise_scope :user do
  #   delete :sign_out, to: 'devise/sessions#destroy', as: :destroy_user_session
  # end
>>>>>>> Stashed changes

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
  get "users/search" => "users#search"
  post "friends/:user_id/create" => "friends#create"
  post "friends/:user_id/destroy" => "friends#destroy"
  get "users/:id/friends" => "users#friends"

  resources :users, :groups, :friends


end

