class Group < ActiveRecord::Base
  attr_accessible :name, :realname_de, :realname_en
  has_many :display_groups, :foreign_key => :fk_id
  has_many :entries, :through => :display_groups

  def alchemy
    self.entries.each do |e|
      e.get_pdf
      e.alchemy
      puts e.title, e.keywords.count
    end
    nil
  end
end
