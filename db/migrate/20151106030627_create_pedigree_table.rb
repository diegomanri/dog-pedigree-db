class CreatePedigreeTable < ActiveRecord::Migration
  def change
    create_table :pedigrees do |t|
      t.references :dog, index: true, foreign_key: true
      t.references :relative, index: true
      t.string :relation_name, null: false
    end
    add_index :pedigrees, ["dog_id", "relative_id", "relation_name"]
  end
end
