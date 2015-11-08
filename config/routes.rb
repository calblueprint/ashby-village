Rails.application.routes.draw do
  ##################################################
  # General
  ##################################################
  authenticated :user do
    root :to => "groups#index", :as => "authenticated_root"
  end
  root 'static_pages#home'

  ##################################################
  # Devise
  ##################################################
  devise_for :users, :path => '',
  :path_names => {:sign_up => 'register', :sign_in => 'login', :sign_out => 'logout'},
  :controllers => { :registrations => 'users/registrations' }

  ##################################################
  # Sessions
  ##################################################
  resources 'exit', to: 'sessions#destroy', as: :logout

  ##################################################
  # Users
  ##################################################
  resources :users, :only => [:show, :edit, :update]

  ##################################################
  # Groups
  ##################################################
  resources :groups
  get "groups/:id/member_listing", to: 'groups#member_listing', as:'member_listing'

end
