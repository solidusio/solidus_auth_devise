class AddUnconfirmedEmailToSpreeUsers < ActiveRecord::Migration[5.2]
  def change
    unless column_exists?(:spree_users, :unconfirmed_email)
      add_column :spree_users, :unconfirmed_email, :string
    end
  end
end
