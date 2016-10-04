prawn_document(:page_layout => :landscape) do |pdf|
  @checklist.to_pdf( pdf)
end