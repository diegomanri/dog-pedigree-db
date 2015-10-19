class RenameFkInEventReg < ActiveRecord::Migration
  def up
    remove_index :event_registrations, ["dog_id", "event_id"]
    rename_column :event_registrations, :dog_id, :user_id
    add_index :event_registrations, ["user_id", "event_id"]
  end

  def down
    remove_index :event_registrations, ["user_id", "event_id"]
    rename_column :event_registrations, :user_id, :dog_id
    add_index :event_registrations, ["dog_id", "event_id"]
  end
end
