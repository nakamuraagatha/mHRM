prawn_document(:page_layout => :landscape) do |pdf|
 @survey.to_pdf(pdf)
end