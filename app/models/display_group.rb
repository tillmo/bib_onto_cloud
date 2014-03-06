class DisplayGroup < ActiveRecord::Base
  attr_accessible :fk_entries, :fk_id, :idtype
  belongs_to :entry, :foreign_key => :fk_entries
  belongs_to :group, :foreign_key => :fk_id
end
