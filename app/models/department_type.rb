class DepartmentType < Enumeration
  has_many :departments

  OptionName = :enumeration_department_type

  def option_name
    OptionName
  end

  def objects
    Department.where(:department_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:department_type_id => to.id)
  end
end