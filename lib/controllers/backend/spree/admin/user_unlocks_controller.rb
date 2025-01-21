# frozen_string_literal: true

module Spree
  module Admin
    class UserUnlocksController < Devise::UnlocksController
      helper 'spree/base'

      include Spree::Core::ControllerHelpers::Auth
      include Spree::Core::ControllerHelpers::Common
      include Spree::Core::ControllerHelpers::Store

      helper 'spree/admin/navigation'
      layout 'spree/layouts/admin'

      private

      def after_unlock_path_for(_resource)
        admin_login_path if is_navigational_format?
      end
    end
  end
end
