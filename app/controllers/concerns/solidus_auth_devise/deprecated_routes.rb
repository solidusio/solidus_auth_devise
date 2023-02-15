# frozen_string_literal: true

module SolidusAuthDevise
  module DeprecatedRoutes
    extend ActiveSupport::Concern

    included do
      before_action :deprecates_solidus_auth_devise_routes
    end

    private

    def deprecates_solidus_auth_devise_routes
      return unless params[:deprecated_route]

      Spree::Deprecation.warn(
        <<~TEXT
          This route is deprecated: #{request.fullpath.inspect}.
          It will be removed in solidus_auth_devise v3.
          If you want to continue using this route please define it in your application code:

          Spree::Core::Engine.routes.draw do
            devise_scope :spree_user do
              #{request.method.downcase} #{request.fullpath.inspect}, to: #{controller_path}##{action_name}, ...
            end
          end

          Please check your application for places in which this route was generated.

        TEXT
      )
    end
  end
end
