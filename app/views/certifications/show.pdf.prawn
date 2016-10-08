prawn_document(:page_layout => :portrait) do |pdf|
  @certification.to_pdf( pdf)
end