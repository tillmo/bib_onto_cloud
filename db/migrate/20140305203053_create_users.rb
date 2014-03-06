class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :fk_groups
      t.string :username
      t.string :realname
      t.string :passwort
      t.boolean :login

      t.timestamps
    end
  end
end
