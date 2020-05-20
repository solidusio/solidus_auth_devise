# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::BaseController, type: :controller do
  describe '#unauthorized_redirect' do
    controller(described_class) do
      def index; authorize!(:read, :something); end
    end

    context "when user is logged in" do
      before { sign_in(create(:user)) }

      it "redirects to unauthorized path" do
        get :index
        expect(response).to redirect_to(spree.unauthorized_path)
      end
    end

    context "when user is not logged in" do
      it "redirects to login path" do
        get :index
        expect(response).to redirect_to(spree.login_path)
      end
    end
  end
end
