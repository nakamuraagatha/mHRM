prawn_document(:page_layout => :portrait) do |pdf|
 @position.to_pdf(pdf)
end