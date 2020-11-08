class AddUnconfirmedEmailToSpreeUsers < SolidusSupport::Migration[5.1]
  def change
    unless column_exists?(:spree_users, :unconfirmed_email)
      add_column :spree_users, :unconfirmed_email, :string
    end
  end
end
