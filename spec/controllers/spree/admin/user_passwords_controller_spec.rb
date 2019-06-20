# frozen_string_literal: true

RSpec.describe Spree::Admin::UserPasswordsController, type: :controller do
  before { @request.env['devise.mapping'] = Devise.mappings[:spree_user] }

  describe '#create' do
    it 'responds with success' do
      post :create, params: { spree_user: { email: 'admin@example.com' } }

      expect(assigns[:spree_user].email).to eq('admin@example.com')
      expect(response.code).to eq('200')
    end
  end
end
