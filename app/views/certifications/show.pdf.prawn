prawn_document(:page_layout => :landscape) do |pdf|
  @certification.to_pdf( pdf)
end