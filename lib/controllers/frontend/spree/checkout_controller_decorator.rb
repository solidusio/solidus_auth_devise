require 'spree/core/validators/email'
Spree::CheckoutController.class_eval do
  prepend_before_filter :check_registration, :except => [:registration, :update_registration]
  prepend_before_filter :check_authorization # must be last prepend_before_filter

  def registration
    @user = Spree::User.new
  end

  def update_registration
    if params[:order][:email] =~ Devise.email_regexp && current_order.update_attribute(:email, params[:order][:email])
      redirect_to spree.checkout_path
    else
      flash[:registration_error] = t(:email_is_invalid, :scope => [:errors, :messages])
      @user = Spree::User.new
      render 'registration'
    end
  end

  private
    def order_params
      params[:order] ? params.require(:order).permit(:email) : {}
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
      current_order.email.present? && Spree::Config[:allow_guest_checkout]
    end

    # Overrides the equivalent method defined in Spree::Core.  This variation of the method will ensure that users
    # are redirected to the tokenized order url unless authenticated as a registered user.
    def completion_route
      return spree.order_path(@order) if spree_current_user
      spree.token_order_path(@order, @order.guest_token)
    end
end
