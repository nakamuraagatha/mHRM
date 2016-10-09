module DocumentsHelper
  def back_url doc
    doc.related_to_id ? doc.case : documents_path
  end
end
