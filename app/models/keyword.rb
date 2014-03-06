class Keyword < ActiveRecord::Base

  attr_accessible :entry, :relevance, :text
  belongs_to :entry

end
