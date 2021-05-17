# frozen_string_literal: true

module Spree
  module UsersControllerDecorator
    def self.prepended(base)
      base.prepend_before_action :authorize_actions, only: :new
      base.prepend_before_action :load_object, only: [:show, :edit, :update]
    end

    def create
      @user = Spree::User.new(user_params)
      if @user.save

        if current_order
          session[:guest_token] = nil
        end

        redirect_back_or_default(root_url)
      else
        render :new
      end
    end

    def update
      if @user.update(user_params)
        spree_current_user.reload
        redirect_url = spree.account_url

        if params[:user][:password].present?
          # this logic needed b/c devise wants to log us out after password changes
          if Spree::Auth::Config[:signout_after_password_change]
            redirect_url = spree.login_url
          else
            bypass_sign_in(@user)
          end
        end
        redirect_to redirect_url, notice: I18n.t('spree.account_updated')
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(Spree::PermittedAttributes.user_attributes | [:email])
    end

    def authorize_actions
      authorize! params[:action].to_sym, Spree::User.new
    end

    # When using a version of Solidus that includes the account page, we just need to
    # decorate the existing controller with further behavior from this extension.
    #
    # On the other hand, when using a version of Solidus that does not include the
    # account page, we need to define the controller from scratch.
    #
    # Once we drop the support for all Solidus versions that don't include the
    # account page, we can just leave the decorator and remove anything else, including
    # the view file at `lib/views/frontend/spree/users/show.html.erb`.
    if defined?(Spree::UsersController)
      Spree::UsersController.prepend(self)
    else
      class Spree::UsersController < Spree::StoreController
        skip_before_action :set_current_order, only: :show, raise: false

        include Spree::Core::ControllerHelpers

        def show
          @orders = @user.orders.complete.order('completed_at desc')
        end

        def load_object
          @user ||= Spree::User.find_by(id: spree_current_user&.id)
          authorize! params[:action].to_sym, @user
        end

        def accurate_title
          I18n.t('spree.my_account')
        end

        prepend Spree::UsersControllerDecorator
      end
    end
  end
end
