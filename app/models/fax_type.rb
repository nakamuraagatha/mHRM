class FaxType < Enumeration
  has_many :organizations

  OptionName = :enumeration_fax_type

  def option_name
    OptionName
  end

  def objects
    Organization.where(:fax_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:activity_id => to.id)
  end
end