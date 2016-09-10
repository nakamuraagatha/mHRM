class RoleType < Enumeration
  has_many :roles

  OptionName = :enumeration_role_type

  def option_name
    OptionName
  end

  def objects
    Role.where(:role_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:role_type_id => to.id)
  end
end