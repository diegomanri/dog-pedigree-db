class AlterColumnEventsEtime < ActiveRecord::Migration
  def up
    change_table :events do |f|
      f.change :etime, :time
    end
  end

  def down
    change_table :events do |f|
      f.change :etime, :datetime
    end
  end
end
