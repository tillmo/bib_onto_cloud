class HomeController < ApplicationController

  def index
    onto = !params[:onto].nil?
    @tag_cloud = Tag.tag_cloud(onto)
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

#4644
#270
#337
