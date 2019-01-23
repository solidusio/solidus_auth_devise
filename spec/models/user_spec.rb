RSpec.describe Spree::User, type: :model do

  before(:all) { Spree::Role.create name: 'admin' }

  it '#admin?' do
    expect(create(:admin_user).admin?).to be true
    expect(create(:user).admin?).to be false
  end

  context "recoverable" do
    let(:user) { create(:user) }

    it 'generates the reset password token' do
      expect(Spree::UserMailer).to receive(:reset_password_instructions).with(user, anything, {}).and_return(double(deliver: true))
      expect { user.send_reset_password_instructions }.to change(user, :reset_password_token).to be_present
    end

    it "regenerates a spree api key on successful password change" do
      user.generate_spree_api_key!

      expect {
        user.password = "123456678"
        user.password_confirmation = "123456678"
        user.save!
      }.to change(user, :spree_api_key)
      expect(user.spree_api_key).to be_present
    end

    it "does not generate a spree api key if password is empty" do
      user.generate_spree_api_key!

      expect {
        user.password = ""
        user.password_confirmation = ""
        user.save!
      }.not_to change(user, :spree_api_key)
    end

    it "does not generate a spree api key on password change if no key existed previously" do
      user.clear_spree_api_key!

      expect {
        user.password = "123456678"
        user.password_confirmation = "123456678"
        user.save!
      }.not_to change(user, :spree_api_key)
      expect(user.reload.spree_api_key).to be_nil
    end
  end

  describe '#destroy' do
    # Users with orders are not deletable in Solidus core
    # therefore we cannot test this behaviour here.
    # Also there are already sufficient specs in core.
    let(:user) { create(:user) }

    it 'acts_as_paranoid' do
      # Instead of testing implementation details of `acts_as_paranoid`
      # we are testing that we are using `acts_as_paranoid` by using duck typing
      expect(described_class).to respond_to(:with_deleted)
      expect(user).to respond_to(:deleted_at)
    end

    context 'with same email address as previously deleted account' do
      it 'will allow users to register later' do
        user1 = build(:user)
        user1.save

        user2 = build(:user)
        user2.email = user1.email
        expect(user2.save).to be false
        expect(user2.errors.messages[:email].first).to eq "has already been taken"

        user1.destroy
        expect(user2.save).to be true
      end
    end
  end

  describe "confirmable" do
    it "is confirmable if the confirmable option is enabled" do
      set_confirmable_option(true)
      allow(Spree::UserMailer).to receive(:confirmation_instructions).and_return(double(deliver: true))
      expect(Spree::User.devise_modules).to include(:confirmable)
      set_confirmable_option(false)
    end

    it "is not confirmable if the confirmable option is disabled" do
      set_confirmable_option(false)
      expect(Spree::User.devise_modules).to_not include(:confirmable)
    end
  end
end
