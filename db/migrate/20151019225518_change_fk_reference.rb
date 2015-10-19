class ChangeFkReference < ActiveRecord::Migration
  def change
    remove_foreign_key :event_registrations, column: :attendee_id
  end
end
