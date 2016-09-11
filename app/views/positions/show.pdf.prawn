prawn_document(:page_layout => :landscape) do |pdf|
 @position.to_pdf(pdf)
end