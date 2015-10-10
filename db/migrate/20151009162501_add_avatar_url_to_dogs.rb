class AddAvatarUrlToDogs < ActiveRecord::Migration
  def up
    add_column :dogs, :avatar_url, :string
  end

  def down
    remove_column :dogs, :avatar_url
  end
end
