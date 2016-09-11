prawn_document(:page_layout => :landscape) do |pdf|
 pdf.font_size(25){  pdf.text "Document title", :style => :bold}
 pdf.text @document.title
 pdf.font_size(25){  pdf.text "Description", :style => :bold}
 pdf.text ActionView::Base.full_sanitizer.sanitize(@document.description)
 pdf.font_size(25){  pdf.text "Document Type", :style => :bold}
 pdf.text @document.document_type
 pdf.font_size(25){  pdf.text "Date", :style => :bold}
 pdf.text @document.date
end