class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :realname_de
      t.string :realname_en

      t.timestamps
    end
  end
end
