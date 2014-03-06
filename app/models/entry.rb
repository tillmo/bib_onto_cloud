class Entry < ActiveRecord::Base

  attr_accessible :abstract, :author, :author_sortkey, :bibkey, :booktitle, :chapter, :crossref, :edition, :editor, :fk_status, :fk_type, :fk_user, :howpublished, :institution_address, :institution_name, :institution_url, :isbn, :issn, :journal, :keywords, :note, :number, :pages, :pdfurl, :psurl, :publisher_address, :publisher_name, :publisher_url, :school_address, :school_name, :school_url, :series, :timestamp, :title, :typpe, :url, :volume, :year
  has_many :display_groups, :foreign_key => :fk_entries
  has_many :groups, :through => :display_groups
#  has_many :keywords
  has_many :tag_entries
  has_many :tags, :through => :tag_entries


  def pdf_filename
    return if pdfurl.blank?
    f = pdfurl.split("/").last
    "#{Rails.root.to_s}/public/pdf/#{f}"
  end

  def get_pdf
    return if pdfurl.blank?
    begin
      File.open(pdf_filename, "wb") do |f| 
        f.write HTTParty.get(pdfurl).parsed_response
      end
      system "pdftotext #{pdf_filename} #{pdf_filename}.txt"
    rescue
    end
  end
   
  def contents
    begin
      File.read("#{pdf_filename}.txt")
    rescue
      ""
    end
  end

  def alchemy
    return if pdfurl.blank?
    return unless self.keywords.empty?
    begin
      t = File.read "#{pdf_filename}.txt"
      if t
        AlchemyAPI.search(:keyword_extraction, :text => t).each do |k|
          Keyword.create(:entry => self, :text => k["text"], 
                         :relevance => k["relevance"].to_s)
        end
      end
    rescue
    end
  end

end
