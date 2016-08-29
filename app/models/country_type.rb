class CountryType < Enumeration
  has_many :addresses

  OptionName = :enumeration_country_type

  def option_name
    OptionName
  end

  def objects
    Address.where(:country_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:country_id => to.id)
  end
end