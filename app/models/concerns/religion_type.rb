class ReligionType < Enumeration
  has_many :core_demographics

  OptionName = :enumeration_religion_type

  def option_name
    OptionName
  end

  def objects
    CoreDemographic.where(:religion_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:religion_id => to.id)
  end
end
