class DropOwners < ActiveRecord::Migration
  def up
    drop_table :owners
  end

  def down
    create_table :owners
    t.string   "ofname",     limit: 255
    t.string   "omname",     limit: 255
    t.string   "olname",     limit: 255
    t.string   "opnumber",   limit: 255
    t.string   "oemail",     limit: 255
    t.string   "ocity",      limit: 255
    t.string   "ozip",       limit: 255
    t.string   "ostate",     limit: 255
    t.timestamps
  end
end
