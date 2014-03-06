class Tag < ActiveRecord::Base
  attr_accessible :count, :text, :onto
  has_many :tag_entries, dependent: :destroy
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

  def self.tag_cloud(onto)
    tag_cloud = []
    Tag.where("count > 5").where("onto = ?",onto).each do |t|
      tag_cloud << {"text" => t.text, "weight" => t.count, 
                    "link" => "/entries/?tag=#{t.text}"}
    end   
    tag_cloud
  end

  def add(e)
    self.count +=1
    self.save
    TagEntry.create(:tag => self, :entry => e)
  end

  def self.read_onto
    File.open("#{Rails.root.to_s}/all.classes.sort") do |f|
      while !f.eof?
        s = f.gets.chomp
        puts s
        h = {:text => s, :count => 0, :onto=> true}
        t = Tag.where(h).first
        if t.nil?
          t = Tag.create(h)
        end
#        c = "grep -il \"#{s}\" #{Rails.root.to_s}/public/pdf/*txt" 
#        res = `#{c}`
#        res.split("\n").each do |file|
#          file = file[0,file.size-4]
          Entry.all.each do |e|
#            if e.pdf_filename==file
            if e.title.downcase.include?(s)
              puts s, e.id
              t.add(e)
            end
          end
        #end
      end
    end
  end

end
