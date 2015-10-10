class CreateEventRegistrations < ActiveRecord::Migration
  def change
    create_table :event_registrations do |t|
      t.references :event, index: true, foreign_key: true
      t.references :dog, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :event_registrations, ["dog_id", "event_id"]
  end
end
