class ProficiencyType < Enumeration
  has_many :languages

  OptionName = :enumeration_proficiency_type

  def option_name
    OptionName
  end

  def objects
    Language.where(:proficiency_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:proficiency_id => to.id)
  end
end