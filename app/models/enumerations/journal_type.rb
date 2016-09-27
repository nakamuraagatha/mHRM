class JournalType < Enumeration
  has_many :journals

  OptionName = :enumeration_journal_type

  def option_name
    OptionName
  end

  def objects
    Journal.where(:journal_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:journal_type_id => to.id)
  end
end