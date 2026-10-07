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
  end
end
