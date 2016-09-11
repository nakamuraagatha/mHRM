prawn_document(:page_layout => :landscape) do |pdf|
 pdf.font_size(25){  pdf.text "Clearance", :style => :bold}
 pdf.text @clearance.clearence_type
 pdf.font_size(25){  pdf.text "Date received", :style => :bold}
 pdf.text @clearance.date_received
 pdf.font_size(25){  pdf.text "Date expired", :style => :bold}
 pdf.text @clearance.date_expired
 pdf.font_size(25){  pdf.text "Note", :style => :bold}
 pdf.text @clearance.note.html_safe
end