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
      skip: [:unlocks, :omniauth_callbacks, :sessions],
      path_names: { sign_out: 'logout' },
      path_prefix: :user,
      router_name: :spree
    })

    resources :users, only: [:edit, :update]

    devise_scope :spree_user do
      # Legacy devise generated paths
      # These are deprecated but we still want to support the incoming routes,
      # in order to give existing stores an upgrade path.
      get 'user/spree_user/sign_in', to: 'user_sessions#new', as: nil
      post 'user/spree_user/sign_in', to: 'user_sessions#create', as: nil

      # Custom Devise routes
      [:new_spree_user_session, :login].each do |helper|
        get '/login', to: 'user_sessions#new', as: helper
      end

      [:spree_user_session, :create_new_session].each do |helper|
        post '/login', to: 'user_sessions#create', as: helper
      end

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
