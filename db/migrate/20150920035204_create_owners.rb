class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :ofname
      t.string :omname
      t.string :olname
      t.string :opnumber
      t.string :oemail
      t.string :ocity
      t.string :ozip
      t.string :ostate

      t.timestamps null: false
    end
  end
end
