# frozen_string_literal: true

Spree::Core::Engine.routes.draw do
  if SolidusSupport.frontend_available? && Spree::Auth::Config.draw_frontend_routes
    devise_for(:spree_user, {
      class_name: 'Spree::User',
      controllers: {
        sessions: 'spree/user_sessions',
        registrations: 'spree/user_registrations',
        passwords: 'spree/user_passwords',
        confirmations: 'spree/user_confirmations'
      },
      skip: :all,
    })

    resources :users, only: [:edit, :update]

    devise_scope :spree_user do
      # Legacy devise generated routes
      get 'user/spree_user/sign_in', to: 'user_sessions#new', as: :new_spree_user_session
      post 'user/spree_user/sign_in', to: 'user_sessions#create', as: :spree_user_session
      match 'user/spree_user/logout', to: 'user_sessions#destroy', as: :destroy_spree_user_session, via: Devise.sign_out_via
      get 'user/spree_user/password/new', to: 'user_passwords#new', as: :new_spree_user_password
      get 'user/spree_user/password/edit', to: 'user_passwords#edit', as: :edit_spree_user_password
      patch 'user/spree_user/password', to: 'user_passwords#update', as: :spree_user_password
      put 'user/spree_user/password', to: 'user_passwords#update'
      post 'user/spree_user/password', to: 'user_passwords#create'
      get 'user/spree_user/cancel', to: 'user_registrations#cancel', as: :cancel_spree_user_registration
      get 'user/spree_user/sign_up', to: 'user_registrations#new', as: :new_spree_user_registration
      get 'user/spree_user/edit', to: 'user_registrations#edit', as: :edit_spree_user_registration
      patch 'user/spree_user', to: 'user_registrations#update', as: :spree_user_registration
      put 'user/spree_user', to: 'user_registrations#update', as: nil
      delete 'user/spree_user', to: 'user_registrations#destroy', as: nil
      post 'user/spree_user', to: 'user_registrations#create', as: nil

      # Custom devise routes
      get '/login', to: 'user_sessions#new', as: :login
      post '/login', to: 'user_sessions#create', as: :create_new_session
      match '/logout', to: 'user_sessions#destroy', as: :logout, via: Devise.sign_out_via
      get '/signup', to: 'user_registrations#new', as: :signup
      post '/signup', to: 'user_registrations#create', as: :registration
      get '/password/recover', to: 'user_passwords#new', as: :recover_password
      post '/password/recover', to: 'user_passwords#create', as: :reset_password
      get '/password/change', to: 'user_passwords#edit', as: :edit_password
      put '/password/change', to: 'user_passwords#update', as: :update_password
      get '/confirm', to: 'user_confirmations#show', as: :confirmation if Spree::Auth::Config[:confirmable]
    end

    get '/checkout/registration', to: 'checkout#registration', as: :checkout_registration
    put '/checkout/registration', to: 'checkout#update_registration', as: :update_checkout_registration

    resource :account, controller: 'users'
  end

  if SolidusSupport.backend_available? && Spree::Auth::Config.draw_backend_routes
    namespace :admin do
      devise_for(:spree_user, {
        class_name: 'Spree::User',
        singular: :spree_user,
        skip: :all,
        path_names: { sign_out: 'logout' },
        controllers: {
          sessions: 'spree/admin/user_sessions',
          passwords: 'spree/admin/user_passwords'
        },
        router_name: :spree
      })

      devise_scope :spree_user do
        get '/authorization_failure', to: 'user_sessions#authorization_failure', as: :unauthorized
        get '/login', to: 'user_sessions#new', as: :login
        post '/login', to: 'user_sessions#create', as: :create_new_session
        match '/logout', to: 'user_sessions#destroy', as: :logout, via: Devise.sign_out_via

        get '/password/recover', to: 'user_passwords#new', as: :recover_password
        post '/password/recover', to: 'user_passwords#create', as: :reset_password
        get '/password/change', to: 'user_passwords#edit', as: :edit_password
        put '/password/change', to: 'user_passwords#update', as: :update_password
      end
    end
  end
end
