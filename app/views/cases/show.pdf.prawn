prawn_document(:page_layout => :landscape) do |pdf|
  @case.to_pdf( pdf)
end