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

      user.password = "123456678"
      user.password_confirmation = "123456678"
      expect { user.save! }.to change(user, :spree_api_key)
      expect(user.spree_api_key).to be_present
    end

    it "does not generate a spree api key on password change if no key existed previously" do
      user.clear_spree_api_key!

      user.password = "123456678"
      user.password_confirmation = "123456678"
      expect { user.save! }.not_to change(user, :spree_api_key)
      expect(user.reload.spree_api_key).to be_nil
    end
  end

  context '#destroy' do
    it 'will soft delete' do
      order = build(:order, completed_at: Time.now)
      order.save
      user = order.user
      user.destroy
      expect(Spree::User.find_by_id(user.id)).to be_nil
      expect(Spree::User.with_deleted.find_by_id(user.id).id).to eq(user.id)
      expect(Spree::User.with_deleted.find_by_id(user.id).orders.first).to eq(order)

      expect(Spree::Order.find_by_user_id(user.id)).not_to be_nil
      expect(Spree::Order.where(user_id: user.id).first).to eq(order)
    end

    it 'will allow users to register later with same email address as previously deleted account' do
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

  describe "confirmable" do
    before { skip "this introduces a run order dependency" }

    it "is confirmable if the confirmable option is enabled" do
      set_confirmable_option(true)
      Spree::UserMailer.stub(:confirmation_instructions).and_return(double(deliver: true))
      expect(Spree::User.devise_modules).to include(:confirmable)
      set_confirmable_option(false)
    end

    it "is not confirmable if the confirmable option is disabled" do
      set_confirmable_option(false)
      expect(Spree::User.devise_modules).to_not include(:confirmable)
    end
  end
end
