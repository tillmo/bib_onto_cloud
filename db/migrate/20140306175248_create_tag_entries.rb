class CreateTagEntries < ActiveRecord::Migration
  def change
    create_table :tag_entries do |t|
      t.integer :tag_id
      t.integer :entry_id

      t.timestamps
    end
  end
end
