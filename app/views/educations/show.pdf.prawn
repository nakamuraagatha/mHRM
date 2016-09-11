prawn_document(:page_layout => :landscape) do |pdf|
   @education.to_pdf(pdf)
end