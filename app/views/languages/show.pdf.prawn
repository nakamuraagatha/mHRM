prawn_document(:page_layout => :landscape) do |pdf|
  @language.to_pdf(pdf)
end