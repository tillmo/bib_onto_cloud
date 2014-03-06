class TagEntry < ActiveRecord::Base
  attr_accessible :entry_id, :tag_id, :entry, :tag
  belongs_to :tag
  belongs_to :entry
end
