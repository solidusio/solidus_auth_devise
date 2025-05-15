# frozen_string_literal: true

RSpec.describe Spree::Admin::UserSessionsController, type: :controller do
  let(:user) { create(:user, password: "secret") }

  before { @request.env["devise.mapping"] = Devise.mappings[:spree_user] } # rubocop:disable RSpec/InstanceVariable

  it "redirects to the admin root after signing in with no stored location" do
    get :new

    post(:create, params: {
      spree_user: {
        email: user.email,
        password: "secret"
      }
    })

    expect(response).to redirect_to spree.admin_path
  end
end
