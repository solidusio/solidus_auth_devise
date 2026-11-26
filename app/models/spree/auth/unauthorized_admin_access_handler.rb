# frozen_string_literal: true

module Spree
  module Auth
    # This service object is responsible for handling unauthorized redirects
    class UnauthorizedAdminAccessHandler
      # @param controller [ApplicationController] an instance of ApplicationController
      #  or its subclasses.
      def initialize(controller)
        @controller = controller
      end

      # This method is responsible for handling unauthorized redirects
      def call
        if spree_current_user
          flash[:error] = I18n.t('spree.authorization_failure')

          redirect_to(spree.admin_unauthorized_path)
        else
          store_location

          redirect_to(spree.admin_login_path)
        end
      end

      private

      attr_reader :controller

      delegate :flash, :redirect_to, :spree_current_user, :store_location, :spree, to: :controller
    end
  end
end
