RSpec.describe Spree::UserRegistrationsController, type: :controller do

  before { @request.env['devise.mapping'] = Devise.mappings[:spree_user] }

  context '#create' do
    before do
      allow(controller).to receive(:after_sign_up_path_for) do
        spree.root_path(thing: 7)
      end
    end

    let(:password_confirmation) { 'foobar123' }

    subject do
      spree_post(:create,
        spree_user: {
          email: 'foobar@example.com',
          password: 'foobar123',
          password_confirmation: password_confirmation
        })
    end

    context 'when user created successfuly' do
      it 'saves the user' do
        expect { subject }.to change { Spree::User.count }.from(0).to(1)
      end

      it 'sets flash message' do
        subject
        expect(flash[:notice]).to eq('Welcome! You have signed up successfully.')
      end

      it 'signs in user' do
        expect(controller.warden).to receive(:set_user)
        subject
      end

      it 'sets spree_user_signup session' do
        subject
        expect(session[:spree_user_signup]).to be true
      end

      it 'tries to associate user with current_order' do
        expect(controller).to receive(:associate_user)
        subject
      end

      it 'redirects to after_sign_up path' do
        subject
        expect(response).to redirect_to spree.root_path(thing: 7)
      end
    end

    context 'when user not valid' do
      let(:password_confirmation) { 'foobard123' }

      it 'resets password fields' do
        expect(controller).to receive(:clean_up_passwords)
        subject
      end

      it 'renders new view' do
        subject
        expect(:response).to render_template(:new)
      end
    end
  end
end
