class EthnicityType < Enumeration
  has_many :core_demographics

  OptionName = :enumeration_ethnicity_type

  def option_name
    OptionName
  end

  def objects
    Department.where(:ethnicity_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:ethnicity_id => to.id)
  end
end