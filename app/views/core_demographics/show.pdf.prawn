prawn_document(:page_layout => :landscape) do |pdf|
  @core_demographic.to_pdf( pdf)
end