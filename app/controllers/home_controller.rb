class HomeController < ApplicationController

  def index
    @tag_cloud = Tag.tag_cloud
  end

  def index2
    @tag_hash = {}
    Keyword.all.each do |k|
      if !@tag_hash[k.text].nil?
        @tag_hash[k.text] += k.relevance
      else
        @tag_hash[k.text] = k.relevance
      end
    end
    @tag_cloud = Keyword.tag_cloud(@tag_hash)
  end

end
