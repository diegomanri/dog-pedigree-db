class AddTimeZoneToEvents < ActiveRecord::Migration
  def up
    add_column :events, :time_zone, :string
    add_column :events, :avatar, :string
    add_column :events, :avatar_url, :string
  end

  def down
    remove_column :events, :avatar_url
    remove_column :events, :avatar
    remove_column :events, :time_zone
  end
end
