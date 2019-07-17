# frozen_string_literal: true

module Spree
  module CheckoutControllerDecorator
    def self.prepended(base)
      base.before_action :check_registration, except: [:registration, :update_registration]
      base.before_action :check_authorization

      # This action builds some associations on the order, ex. addresses, which we
      # don't to build or save here.
      base.skip_before_action :setup_for_current_state, only: [:registration, :update_registration]
    end

    def registration
      @user = Spree::User.new
    end

    def update_registration
      if params[:order][:email] =~ Devise.email_regexp && current_order.update(email: params[:order][:email])
        redirect_to spree.checkout_path
      else
        flash[:registration_error] = t(:email_is_invalid, scope: [:errors, :messages])
        @user = Spree::User.new
        render 'registration'
      end
    end

    private

    def order_params
      params.
        fetch(:order, {}).
        permit(:email)
    end

    def skip_state_validation?
      %w(registration update_registration).include?(params[:action])
    end

    def check_authorization
      authorize!(:edit, current_order, cookies.signed[:guest_token])
    end

    # Introduces a registration step whenever the +registration_step+ preference is true.
    def check_registration
      return unless registration_required?

      store_location
      redirect_to spree.checkout_registration_path
    end

    def registration_required?
      Spree::Auth::Config[:registration_step] &&
        !already_registered?
    end

    def already_registered?
      spree_current_user || guest_authenticated?
    end

    def guest_authenticated?
      current_order&.email.present? &&
        Spree::Config[:allow_guest_checkout]
    end

    # Overrides the equivalent method defined in Spree::Core.  This variation of the method will ensure that users
    # are redirected to the tokenized order url unless authenticated as a registered user.
    def completion_route
      return spree.order_path(@order) if spree_current_user

      spree.token_order_path(@order, @order.guest_token)
    end

    ::Spree::CheckoutController.prepend self
  end
end
