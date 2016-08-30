class ContactType < Enumeration
  has_many :contacts

  OptionName = :enumeration_contact_type

  def option_name
    OptionName
  end

  def objects
    Contact.where(:activity_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:activity_id => to.id)
  end
end