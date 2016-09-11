prawn_document(:page_layout => :landscape) do |pdf|
 @other_skill.to_pdf(pdf)
end