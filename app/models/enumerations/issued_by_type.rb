class IssuedByType < Enumeration
  has_many :identifications

  OptionName = :enumeration_issued_by_type

  def option_name
    OptionName
  end

  def objects
    Identification.where(:issued_by_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:issued_by_type_id => to.id)
  end
end