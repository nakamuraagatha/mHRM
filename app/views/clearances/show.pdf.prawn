prawn_document(:page_layout => :landscape) do |pdf|
  @clearance.to_pdf( pdf)
end