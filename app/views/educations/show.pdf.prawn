prawn_document(:page_layout => :portrait) do |pdf|
   @education.to_pdf(pdf)
end