class StateType < Enumeration
  has_many :addresses

  OptionName = :enumeration_state_type

  def option_name
    OptionName
  end

  def objects
    Address.where(:state_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:state_id => to.id)
  end
end