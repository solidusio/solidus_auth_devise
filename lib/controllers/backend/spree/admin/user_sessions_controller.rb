# frozen_string_literal: true

class Spree::Admin::UserSessionsController < Devise::SessionsController
  helper 'spree/base'

  include Spree::Core::ControllerHelpers::Auth
  include Spree::Core::ControllerHelpers::Common
  include Spree::Core::ControllerHelpers::Store

  helper 'spree/admin/navigation'
  layout 'spree/layouts/admin'

  def create
    authenticate_spree_user!

    if spree_user_signed_in?
      respond_to do |format|
        format.html {
          flash[:success] = I18n.t('spree.logged_in_succesfully')
          redirect_back_or_default(after_sign_in_path_for(spree_current_user))
        }
        format.js {
          user = resource.record
          render json: { ship_address: user.ship_address, bill_address: user.bill_address }.to_json
        }
      end
    else
      flash.now[:error] = t('devise.failure.invalid')
      render :new
    end
  end

  def authorization_failure
  end

  private

  # NOTE: as soon as this gem stops supporting Solidus 3.1 if-else should be removed and left only include
  if defined?(::Spree::Admin::SetsUserLanguageLocaleKey)
    include ::Spree::Admin::SetsUserLanguageLocaleKey
  else
    def set_user_language_locale_key
      :admin_locale
    end
  end

  def accurate_title
    I18n.t('spree.login')
  end

  def redirect_back_or_default(default)
    redirect_to(session["spree_user_return_to"] || default)
    session["spree_user_return_to"] = nil
  end
end
