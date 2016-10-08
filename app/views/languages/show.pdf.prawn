prawn_document(:page_layout => :portrait) do |pdf|
  @language.to_pdf(pdf)
end