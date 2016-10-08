prawn_document(:page_layout => :portrait) do |pdf|
 @survey.to_pdf(pdf)
end