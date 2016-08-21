class SocialMediaType < Enumeration
  has_many :organizations

  OptionName = :enumeration_social_media_type

  def option_name
    OptionName
  end

  def objects
    # .where(:fax_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:activity_id => to.id)
  end
end