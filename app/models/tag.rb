class Tag < ActiveRecord::Base
  attr_accessible :count, :text
  has_many :tag_entries
  has_many :entries, :through => :tag_entries

TRIVIAL_WORDS = ["the","a","with","from","for","in","and","of","on",
           "you","to","using","how","what","by","one","or","is","zur",
           "not","toward","can","as","an","based","about","between",
           "use","towards","und"]

  def self.enter_text(h,t,e)
    t.split(" ").each do |k|
      kd = k.downcase.gsub(/[^0-9a-z]/i, '')
      kd_but_last = kd[0,kd.size-1]
      if !h[kd].nil?
        h[kd] << e
      elsif !h[kd+"s"].nil?
        h[kd+"s"] << e
      elsif kd[-1]=="s" and !h[kd_but_last].nil?
        h[kd_but_last] << e
      else
        h[kd] = [e]
      end
    end
  end


  def self.compute_tags
    @tag_hash = {}
    Group.find(6).entries.each do |e|
      enter_text(@tag_hash,e.title,e)  # +e.keywords
    end
    @tag_hash.each do |tag,entries|
      if !TRIVIAL_WORDS.include?(tag)
        t=create(:text => tag, :count => entries.size)
        entries.each do |e|
          TagEntry.create(:tag=>t, :entry=>e)
        end 
      end
    end   
  end

  def self.tag_cloud
    tag_cloud = []
    Tag.where("count > 5").each do |t|
      tag_cloud << {"text" => t.text, "weight" => t.count, 
                    "link" => "/entries/?tag=#{t.text}"}
    end   
    tag_cloud
  end


end
