class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :text
      t.float :relevance
      t.integer :entry_id

      t.timestamps
    end
  end
end
