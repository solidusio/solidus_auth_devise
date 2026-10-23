# frozen_string_literal: true

RSpec.describe Spree::Admin::UserPasswordsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:spree_user]
  end

  describe "#create" do
    before do
      create(:store)
      create(:user, email: "admin@example.com")
    end

    it "redirects to the login page" do
      post :create, params: {spree_user: {email: "admin@example.com"}}

      expect(assigns[:spree_user].email).to eq("admin@example.com")
      expect(response).to have_http_status(302)
    end

    context "when the user email is not found" do
      it "re-renders the form" do
        post :create, params: {spree_user: {email: "unknown@example.com"}}

        expect(response).to have_http_status(200)
        expect(response).to render_template :new
      end

      context "when Devise is in paranoid mode" do
        around do |example|
          original_paranoid = Devise.paranoid
          Devise.paranoid = true
          example.run
          Devise.paranoid = original_paranoid
        end

        it "does not reveal that the email is not found" do
          post :create, params: {spree_user: {email: "unknown@example.com"}}

          expect(response).to have_http_status(302)
        end
      end
    end

    context "when Devise is in paranoid mode" do
      around do |example|
        original_paranoid = Devise.paranoid
        Devise.paranoid = true
        example.run
        Devise.paranoid = original_paranoid
      end

      context "when a user without admin access is signed in" do
        before { sign_in(create(:user)) }

        it "redirects to the same location whether or not the email is found" do
          post :create, params: {spree_user: {email: "admin@example.com"}}
          found_location = response.location

          post :create, params: {spree_user: {email: "unknown@example.com"}}

          expect(found_location).to eq(response.location)
        end
      end

      context "when an admin is signed in" do
        before { sign_in(create(:admin_user)) }

        it "redirects to the found user's admin page" do
          user = Spree::User.find_by!(email: "admin@example.com")

          post :create, params: {spree_user: {email: "admin@example.com"}}

          expect(response).to redirect_to spree.admin_user_path(user)
        end

        it "redirects to the login page when the email is not found" do
          post :create, params: {spree_user: {email: "unknown@example.com"}}

          expect(response).to redirect_to spree.admin_login_path
        end
      end
    end
  end
end
