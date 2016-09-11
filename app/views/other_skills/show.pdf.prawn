prawn_document(:page_layout => :landscape) do |pdf|
 pdf.font_size(25){  pdf.text "Skill", :style => :bold}
 pdf.text @other_skill.name
 pdf.font_size(25){  pdf.text "Date received", :style => :bold}
 pdf.text @other_skill.date_received
 pdf.font_size(25){  pdf.text "Date expired", :style => :bold}
 pdf.text @other_skill.date_expired
 pdf.font_size(25){  pdf.text "Note", :style => :bold}
 pdf.text @other_skill.note.html_safe
end