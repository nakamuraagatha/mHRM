class CaseType < Enumeration
  has_many :cases

  OptionName = :enumeration_case_type

  def option_name
    OptionName
  end

  def objects
    Case.where(:case_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:case_type_id => to.id)
  end
end