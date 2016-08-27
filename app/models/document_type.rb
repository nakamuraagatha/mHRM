class DocumentType < Enumeration
  has_many :documents

  OptionName = :enumeration_document_type

  def option_name
    OptionName
  end

  def objects
    Document.where(:document_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:document_type_id => to.id)
  end
end