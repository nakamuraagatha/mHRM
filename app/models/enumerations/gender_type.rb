class GenderType < Enumeration
  has_many :core_demographics

  OptionName = :enumeration_gender_type

  def option_name
    OptionName
  end

  def objects
    CoreDemographic.where(:gender_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:gender_id => to.id)
  end
end