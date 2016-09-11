prawn_document(:page_layout => :landscape) do |pdf|
 pdf.font_size(25){  pdf.text "Emergency contact", :style => :bold}
 pdf.text @contact.emergency_contact
 pdf.font_size(25){  pdf.text "First namet", :style => :bold}
 pdf.text @contact.first_name
 pdf.font_size(25){  pdf.text "Middle name", :style => :bold}
 pdf.text @contact.middle_name
 pdf.font_size(25){  pdf.text "Last name", :style => :bold}
 pdf.text @contact.first_name
 pdf.font_size(25){  pdf.text "Note", :style => :bold}
 pdf.text ActionView::Base.full_sanitizer.sanitize(@contact.note)


 render 'extend_demographies/show', :pdf=> pdf, extend_information: @contact.extend_informations

end