class CreateDisplayGroups < ActiveRecord::Migration
  def change
    create_table :display_groups do |t|
      t.integer :fk_entries
      t.integer :fk_id
      t.string :idtype

      t.timestamps
    end
  end
end
