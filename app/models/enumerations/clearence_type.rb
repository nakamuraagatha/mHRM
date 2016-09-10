class ClearenceType < Enumeration
  has_many :clearances

  OptionName = :enumeration_clearence_type

  def option_name
    OptionName
  end

  def objects
    Clearance.where(:clearence_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:clearence_type_id => to.id)
  end
end