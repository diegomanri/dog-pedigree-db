class FromUsersRemoveAdminColumnAddRoleColumn < ActiveRecord::Migration
  def up
    remove_column :users, :admin
    add_column :users, :role, :integer
  end

  def down
    remove_column :users, :role
    add_column :users, :admin, :boolean
  end
end
