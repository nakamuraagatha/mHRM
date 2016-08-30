class  IdentificationType < Enumeration
  has_many :identifications

  OptionName = :enumeration_identification_type

  def option_name
    OptionName
  end

  def objects
    Identification.where(:identification_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:identification_type_id => to.id)
  end
end