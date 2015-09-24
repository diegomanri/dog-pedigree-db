class AddEmailConfirmColumnToUsers < ActiveRecord::Migration
  def up
    add_column :users, :email_confirmed, :boolean, :default => false
    add_column :users, :confirm_token, :string
  end

  def down
    remove_column :users, :confirm_token
    remove_column :users, :email_confirmed
  end
end
