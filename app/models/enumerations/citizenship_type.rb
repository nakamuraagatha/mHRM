class CitizenshipType < Enumeration
  has_many :core_demographics

  OptionName = :enumeration_citizenship_type

  def option_name
    OptionName
  end

  def objects
    CoreDemographic.where(:citizenship_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:citizenship_type_id => to.id)
  end
end