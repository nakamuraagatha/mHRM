prawn_document(:page_layout => :landscape) do |pdf|
 pdf.font_size(25){  pdf.text "Note", :style => :bold}
 pdf.text ActionView::Base.full_sanitizer.sanitize(@department.note)
 pdf.font_size(25){  pdf.text "Date start", :style => :bold}
 pdf.text @department.date_start
 pdf.font_size(25){  pdf.text "Date end", :style => :bold}
 pdf.text @department.date_end

 render 'extend_demographies/show', :pdf=> pdf, extend_information: @department.extend_informations

end