class AddSexToDogs < ActiveRecord::Migration
  def up
    add_column :dogs, :sex, :string
  end

  def down
    remove_column :dogs, :sex, :string
  end
end
