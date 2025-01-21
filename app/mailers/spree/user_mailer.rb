# frozen_string_literal: true

module Spree
  class UserMailer < BaseMailer
    def reset_password_instructions(user, token, *_args)
      @store = Spree::Store.default
      @edit_password_reset_url = spree.edit_spree_user_password_url(reset_password_token: token, host: @store.url)
      mail to: user.email, from: from_address(@store), subject: "#{@store.name} #{I18n.t(:subject, scope: [:devise, :mailer, :reset_password_instructions])}"
    end

    def confirmation_instructions(user, token, _opts = {})
      @store = Spree::Store.default
      @confirmation_url = spree.spree_user_confirmation_url(confirmation_token: token, host: @store.url)
      mail to: user.email, from: from_address(@store), subject: "#{@store.name} #{I18n.t(:subject, scope: [:devise, :mailer, :confirmation_instructions])}"
    end

    def unlock_instructions(user, token, _opts = {})
      @store = Spree::Store.default
      @user = user

      @unlock_url = spree.admin_unlock_url(unlock_token: token, host: @store.url)
      mail to: user.email, from: from_address(@store), subject: "#{@store.name} #{I18n.t(:subject, scope: [:devise, :mailer, :unlock_instructions])}"
    end
  end
end
