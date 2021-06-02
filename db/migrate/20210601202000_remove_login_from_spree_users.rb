# frozen_string_literal: true

class RemoveLoginFromSpreeUsers < SolidusSupport::Migration[5.1]
  def change
    remove_column(:spree_users, :login, :string)
  end
end
