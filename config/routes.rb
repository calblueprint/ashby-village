Rails.application.routes.draw do
  ##################################################
  # General
  ##################################################
  authenticated :user do
    root :to => "groups#index", :as => "authenticated_root"
  end
  root 'static_pages#home'

<<<<<<< HEAD
  devise_for :users, :path => '',
  :path_names => {:sign_up => 'register', :sign_in => 'login', :sign_out => 'logout'},
  :controllers => { :registrations => 'users/registrations' }

  resources :users, :only => [:show, :edit, :update]
=======

  ##################################################
  # Devise
  ##################################################
  devise_for :users, :path => '', :path_names => {:sign_up => 'register', :sign_in => 'login', :sign_out => 'logout'}, :controllers => { :registrations => 'users/registrations' }

  ##################################################
  # Sessions
  ##################################################
  resources 'exit', to: 'sessions#destroy', as: :logout

  ##################################################
  # Users
  ##################################################
  get 'user/show'

  get 'user/:id', to: "user#show", as: 'user'
>>>>>>> master

  ##################################################
  # Groups
  ##################################################
  resources :groups
  get "groups/:id/member_listing", to: 'groups#member_listing', as:'member_listing'

  # get 'groups/:id', to: 'users#show'

end
