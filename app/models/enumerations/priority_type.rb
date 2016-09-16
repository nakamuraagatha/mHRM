class PriorityType < Enumeration
  has_many :tasks

  OptionName = :enumeration_priority_type

  def option_name
    OptionName
  end

  def objects
    Task.where(:priority_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:priority_id => to.id)
  end
end