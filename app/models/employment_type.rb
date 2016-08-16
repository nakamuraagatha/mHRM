class EmploymentType < Enumeration
  has_many :employments

  OptionName = :enumeration_employment_type

  def option_name
    OptionName
  end

  def objects
    Employment.where(:activity_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:activity_id => to.id)
  end
end