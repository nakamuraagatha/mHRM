prawn_document(:page_layout => :portrait) do |pdf|
  @checklist.to_pdf( pdf)
end