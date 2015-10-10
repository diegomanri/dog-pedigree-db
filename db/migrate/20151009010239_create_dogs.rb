class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :dname
      t.string :breed
      t.string :variety
      t.date :dob
      t.string :height
      t.string :weight
      t.string :pedinum
      t.string :occupation
      t.string :workcert
      t.string :health
      t.text :dcomments
      t.string :avatar
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :dogs, ["dname", "user_id"]
  end
end
