class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :ufname, :limit => 50
      t.string :umname, :limit => 20
      t.string :ulname, :limit => 50
      t.string :uemail, :limit => 100
      t.string :username, :limit => 25
      t.string :password_digest
      t.boolean :admin, :default => false

      t.timestamps null: false
    end
  end
end
