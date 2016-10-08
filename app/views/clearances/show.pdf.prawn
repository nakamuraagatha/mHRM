prawn_document(:page_layout => :portrait) do |pdf|
  @clearance.to_pdf( pdf)
end