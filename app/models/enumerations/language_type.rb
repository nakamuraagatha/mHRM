class LanguageType < Enumeration
  has_many :languages

  OptionName = :enumeration_language_type

  def option_name
    OptionName
  end

  def objects
    Language.where(:language_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:language_type_id => to.id)
  end
end