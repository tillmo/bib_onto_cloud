class AddOntoToTag < ActiveRecord::Migration
  def change
    add_column :tags, :onto, :boolean
  end
end
