class AddCreatorToEvents < ActiveRecord::Migration
  def up
    add_column :events, :creator_id, :integer
  end

  def down
    remove_column :events, :creator_id
  end
end
