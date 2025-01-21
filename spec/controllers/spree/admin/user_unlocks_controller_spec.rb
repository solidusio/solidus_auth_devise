# frozen_string_literal: true

RSpec.describe Spree::Admin::UserUnlocksController, type: :controller do
  # rubocop:disable RSpec/InstanceVariable
  before { @request.env['devise.mapping'] = Devise.mappings[:spree_user] }

  describe '#create' do
    let(:user) { create(:user, locked_at: Time.current) }

    it 'sends unlock instructions to the user' do
      # rubocop:disable RSpec/StubbedMock
      expect(Spree::UserMailer).to receive(:unlock_instructions).and_return(double(deliver: true))
      # rubocop:enable RSpec/StubbedMock

      post :create, params: { spree_user: { email: user.email } }

      expect(assigns[:spree_user].email).to eq(user.email)
      expect(response.code).to eq('302')
    end
  end

  describe '#show' do
    let(:user) { create(:user, locked_at: Time.current) }

    before {
      @raw_token, encrypted_token = Devise.token_generator.generate(user.class, :unlock_token)
      user.update(unlock_token: encrypted_token)
    }

    it 'unlocks a previously locked user' do
      get :show, params: { unlock_token: @raw_token }

      expect(response.code).to eq '302'
      expect(user.reload.locked_at).to be_nil
    end
  end

  # rubocop:enable RSpec/InstanceVariable
end
