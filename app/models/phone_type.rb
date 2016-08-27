class PhoneType < Enumeration
  has_many :phones

  OptionName = :enumeration_phone_type

  def option_name
    OptionName
  end

  def objects
    Organization.where(:phone_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:phone_type_id => to.id)
  end
end