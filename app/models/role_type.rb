class RoleType < Enumeration
  has_many :roles

  OptionName = :role_type

  def option_name
    OptionName
  end

  def objects
    Role.where(:activity_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:activity_id => to.id)
  end
end