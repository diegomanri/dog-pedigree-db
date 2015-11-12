class AddDefaultTopedigree < ActiveRecord::Migration
  def up
    change_column :pedigrees, :relation_name, :string, :default => 'Sibling'
  end

  def down
    change_column :pedigrees, :relation_name, :string, :default => nil
  end
end
