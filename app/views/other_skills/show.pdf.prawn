prawn_document(:page_layout => :portrait) do |pdf|
 @other_skill.to_pdf(pdf)
end