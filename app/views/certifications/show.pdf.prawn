prawn_document(:page_layout => :landscape) do |pdf|
 pdf.font_size(25){  pdf.text "Certification", :style => :bold}
 pdf.text @certification.certification_type
 pdf.font_size(25){  pdf.text "Date received", :style => :bold}
 pdf.text @certification.date_received
 pdf.font_size(25){  pdf.text "Date expired", :style => :bold}
 pdf.text @certification.date_expired
 pdf.font_size(25){  pdf.text "Note", :style => :bold}
 pdf.text @certification.note.html_safe
end