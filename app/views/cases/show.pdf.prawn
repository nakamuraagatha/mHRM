prawn_document(:page_layout => :portrait) do |pdf|
  @case.to_pdf( pdf)
end