class Tag <ActsAsTaggableOn::Tag
  def self.counts
  #self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
 
 Tag.select("tags.id, tags.name,count(taggings.tag_id) as count"). joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end

end
