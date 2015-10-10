class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :ename
      t.date :edate
      t.datetime :etime
      t.text :edescription
      t.string :estateprov
      t.string :ecity
      t.string :ezippostal
      t.string :ecountry

      t.timestamps null: false
    end
  end
end
