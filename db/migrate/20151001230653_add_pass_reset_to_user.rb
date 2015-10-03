class AddPassResetToUser < ActiveRecord::Migration
  def up
    add_column :users, :reset_digest, :string
    add_column :users, :reset_set_at, :datetime
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
  end

  def down
    remove_column :users, :zip
    remove_column :users, :state
    remove_column :users, :city
    remove_column :users, :reset_set_at
    remove_column :users, :reset_digest
  end
end
