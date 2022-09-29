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
      path_names: { sign_out: 'logout' },
      path_prefix: :user,
      router_name: :spree
    })

    resources :users, only: [:edit, :update]

    devise_scope :spree_user do
      # Custom devise routes
      get   '/login', to: 'user_sessions#new', as: :login
      post  '/login', to: 'user_sessions#create', as: :create_new_session
      match '/logout', to: 'user_sessions#destroy', via: Devise.sign_out_via, as: :logout
      get   '/password/recover', to: 'user_passwords#new', as: :recover_password
      get   '/password/change', to: 'user_passwords#edit', as: :edit_password
      put   '/password/change', to: 'user_passwords#update', as: :update_password
      post  '/password/recover', to: 'user_passwords#create', as: :reset_password
      get   '/signup', to: 'user_registrations#new', as: :signup
      post  '/signup', to: 'user_registrations#create', as: :registration
      get   '/confirm', to: 'user_confirmations#show', as: :confirmation if Spree::Auth::Config[:confirmable]

      # Legacy devise generated paths
      #
      # These are deprecated but we still want to support the incoming routes, in order to give existing stores an upgrade path.
      # Will be removed at the next major release of solidus_auth_devise.
      get    '/user/spree_user/password/edit' => 'user_passwords#edit', as: :deprecated_edit_spree_user_password
      get    '/password/change'               => 'user_passwords#edit', as: :edit_spree_user_password
      get    '/user/spree_user/password/new'  => 'user_passwords#new', as: :deprecated_new_spree_user_password
      get    '/password/recover'              => 'user_passwords#new', as: :new_spree_user_password
      match  '/user/spree_user/password'      => 'user_passwords#update', via: [:patch, :put], as: :deprecated_spree_user_password
      put    '/password/change'               => 'user_passwords#update', as: :spree_user_password
      post   '/user/spree_user/password'      => 'user_passwords#create', as: nil

      get    '/login'                         => 'user_sessions#new', as: :new_spree_user_session
      get    '/user/spree_user/sign_in'       => 'user_sessions#new', as: :deprecated_new_spree_user_session
      match  '/user/spree_user/logout'        => 'user_sessions#destroy', via: Devise.sign_out_via, as: :deprecated_destroy_spree_user_session
      match  '/logout'                        => 'user_sessions#destroy', via: Devise.sign_out_via, as: :destroy_spree_user_session
      post   '/user/spree_user/sign_in'       => 'user_sessions#create', as: :deprecated_spree_user_session
      post   '/login'                         => 'user_sessions#create', as: :spree_user_session

      get    '/user/spree_user/sign_up'       => 'user_registrations#new', as: :deprecated_new_spree_user_registration
      get    '/signup'                        => 'user_registrations#new', as: :new_spree_user_registration
      post   '/user/spree_user'               => 'user_registrations#create', as: nil
      get    '/user/spree_user/cancel'        => 'user_registrations#cancel', as: :cancel_spree_user_registration
      get    '/user/spree_user/edit'          => 'user_registrations#edit', as: :edit_spree_user_registration
      delete '/user/spree_user'               => 'user_registrations#destroy', as: nil
      match  '/user/spree_user'               => 'user_registrations#update', as: :spree_user_registration, via: [:patch, :put]
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
