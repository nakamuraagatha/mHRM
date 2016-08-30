class SocialMediaType < Enumeration
  has_many :social_media

  OptionName = :enumeration_social_media_type

  def option_name
    OptionName
  end

  def objects
    SocialMedium.where(:social_media_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:social_media_type_id => to.id)
  end
end