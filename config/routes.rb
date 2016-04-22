# == Route Map
#
#                   Prefix Verb   URI Pattern                          Controller#Action
#       authenticated_root GET    /                                    groups#index
#                     root GET    /                                    static_pages#home
#         new_user_session GET    /login(.:format)                     devise/sessions#new
#             user_session POST   /login(.:format)                     devise/sessions#create
#     destroy_user_session DELETE /logout(.:format)                    devise/sessions#destroy
#            user_password POST   /password(.:format)                  devise/passwords#create
#        new_user_password GET    /password/new(.:format)              devise/passwords#new
#       edit_user_password GET    /password/edit(.:format)             devise/passwords#edit
#                          PATCH  /password(.:format)                  devise/passwords#update
#                          PUT    /password(.:format)                  devise/passwords#update
# cancel_user_registration GET    /cancel(.:format)                    users/registrations#cancel
#        user_registration POST   /                                    users/registrations#create
#    new_user_registration GET    /register(.:format)                  users/registrations#new
#   edit_user_registration GET    /account_settings(.:format)          users/registrations#edit
#                          PATCH  /                                    users/registrations#update
#                          PUT    /                                    users/registrations#update
#                          DELETE /                                    users/registrations#destroy
#         account_settings GET    /account_settings(.:format)          users/registrations#edit
#             logout_index GET    /exit(.:format)                      sessions#destroy
#                          POST   /exit(.:format)                      sessions#destroy
#               new_logout GET    /exit/new(.:format)                  sessions#destroy
#              edit_logout GET    /exit/:id/edit(.:format)             sessions#destroy
#                   logout GET    /exit/:id(.:format)                  sessions#destroy
#                          PATCH  /exit/:id(.:format)                  sessions#destroy
#                          PUT    /exit/:id(.:format)                  sessions#destroy
#                          DELETE /exit/:id(.:format)                  sessions#destroy
#                edit_user GET    /users/:id/edit(.:format)            users#edit
#                     user GET    /users/:id(.:format)                 users#show
#                          PATCH  /users/:id(.:format)                 users#update
#                          PUT    /users/:id(.:format)                 users#update
#                   groups GET    /groups(.:format)                    groups#index
#                          POST   /groups(.:format)                    groups#create
#                new_group GET    /groups/new(.:format)                groups#new
#               edit_group GET    /groups/:id/edit(.:format)           groups#edit
#                    group GET    /groups/:id(.:format)                groups#show
#                          PATCH  /groups/:id(.:format)                groups#update
#                          PUT    /groups/:id(.:format)                groups#update
#                          DELETE /groups/:id(.:format)                groups#destroy
#           member_listing GET    /groups/:id/member_listing(.:format) groups#member_listing
#

Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  ##################################################
  # General
  ##################################################
  authenticated :user do
    root to: "groups#index", as: "authenticated_root"
  end
  root 'static_pages#home'

  ##################################################
  # Devise
  ##################################################
  devise_for :users, path: "", path_names: {
    sign_up: "register",
    sign_in: "login",
    sign_out: "logout",
    edit: "users/:id/account_settings",
  }, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords"
    # confirm: "confirmations#show",
  }
  devise_scope :users do
    get "users/:id/account_settings" => "users/registrations#edit", as: "account_settings"
    # TODO(Shannon): Refactor routes.
  end

  ##################################################
  # Sessions
  ##################################################
  resources "exit", to: 'sessions#destroy', as: :logout

  ##################################################
  # Users
  ##################################################
  resources :users, only: [:show, :edit, :update]

  ##################################################
  # Groups
  ##################################################
  resources :groups do
    get :autocomplete_user_full_name, on: :collection
    get :autocomplete_group_name, on: :collection
    member do
      get "member_listing"
      put "join"
      put "leave"
    end
    resources :events do
      get "attendance"
      patch "rsvp"
      patch "cancel"
    end
  end
###################################################
# Posts
###################################################
  resources :posts do
      resources :replies
  end

  ##################################################
  # Events
  ##################################################

end
