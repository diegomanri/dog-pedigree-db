class FixMistake < ActiveRecord::Migration
  def up
    remove_index :event_registrations, ["user_id", "event_id"]
    rename_column :event_registrations, :user_id, :attendee_id
    add_index :event_registrations, ["attendee_id", "event_id"]
  end

  def down
    remove_index :event_registrations, ["attendee_id", "event_id"]
    rename_column :event_registrations, :attendee_id, :user_id
    add_index :event_registrations, ["user_id", "event_id"]
  end
end
