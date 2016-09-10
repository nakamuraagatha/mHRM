class AffiliationType < Enumeration
  has_many :affiliations

  OptionName = :enumeration_affiliation_type

  def option_name
    OptionName
  end

  def objects
    Affiliation.where(:affiliation_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:affiliation_type_id => to.id)
  end
end