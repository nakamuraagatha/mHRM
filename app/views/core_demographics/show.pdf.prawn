prawn_document(:page_layout => :portrait) do |pdf|
  @core_demographic.to_pdf( pdf)
end