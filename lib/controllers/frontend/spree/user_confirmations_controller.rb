# frozen_string_literal: true

class Spree::UserConfirmationsController < Devise::ConfirmationsController
  helper "spree/base", "spree/store"

  include Spree::Core::ControllerHelpers::Auth
  include Spree::Core::ControllerHelpers::Common
  include Spree::Core::ControllerHelpers::Order
  include Spree::Core::ControllerHelpers::Store

  protected

  def after_confirmation_path_for(resource_name, resource)
    signed_in?(resource_name) ? spree.signed_in_root_path(resource) : spree.login_path
  end
end
