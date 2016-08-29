class LocationType < Enumeration
  has_many :positions

  OptionName = :enumeration_location_type

  def option_name
    OptionName
  end

  def objects
    Position.where(:location_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:location_type_id => to.id)
  end
end