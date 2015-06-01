RSpec.describe Spree::UserSessionsController, type: :controller do
  let(:user) { create(:user) }

  before { @request.env['devise.mapping'] = Devise.mappings[:spree_user] }

  context "#create" do
    let(:format) { :html }
    let(:password) { 'secret' }

    subject do
      spree_post(:create,
        spree_user: {
          email: user.email,
          password: password
        },
        format: format)
    end

    context "when using correct login information" do
      it 'properly assigns orders user from guest_token' do
        order1 = create(:order, guest_token: 'ABC', user_id: nil, created_by_id: nil)
        order2 = create(:order, guest_token: 'ABC', user_id: 200)
        request.cookie_jar.signed[:guest_token] = 'ABC'

        subject

        expect(order1.reload.user_id).to eq user.id
        expect(order1.reload.created_by_id).to eq user.id
        expect(order2.reload.user_id).to eq 200
      end

      context "when html format is requested" do
        it "redirects to default after signing in" do
          subject
          expect(response).to redirect_to spree.root_path
        end
      end

      context "when js format is requested" do
        let(:format) { :js }

        it "returns a json with ship and bill address" do
          subject
          parsed = ActiveSupport::JSON.decode(response.body)
          expect(parsed).to have_key("user")
          expect(parsed).to have_key("ship_address")
          expect(parsed).to have_key("bill_address")
        end
      end
    end

    context "when using incorrect login information" do
      let(:password) { 'wrong' }

      context "when html format is requested" do
        it "renders new template again with errors" do
          subject
          expect(response).to render_template(:new)
          expect(flash[:error]).to eq I18n.t(:'devise.failure.invalid')
        end
      end

      context "when js format is requested" do
        let(:format) { :js }
        it "returns json with the error" do
          subject
          parsed = ActiveSupport::JSON.decode(response.body)
          expect(parsed).to have_key("error")
        end
      end
    end
  end
end
