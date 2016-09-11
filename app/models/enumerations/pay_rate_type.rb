class PayRateType < Enumeration
  has_many :positions

  OptionName = :enumeration_pay_rate_type

  def option_name
    OptionName
  end

  def objects
    Position.where(:pay_rate_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:pay_rate_id => to.id)
  end
end