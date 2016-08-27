class AddressType < Enumeration
  has_many :addresses

  OptionName = :enumeration_address_type

  def option_name
    OptionName
  end

  def objects
    Document.where(:address_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:address_type_id => to.id)
  end
end