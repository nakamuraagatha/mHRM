class EmailType < Enumeration
  has_many :emails

  OptionName = :enumeration_email_type

  def option_name
    OptionName
  end

  def objects
    Organization.where(:email_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:email_type_id => to.id)
  end
end