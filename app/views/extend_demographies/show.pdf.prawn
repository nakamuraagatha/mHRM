 prawn_document(:page_layout => :landscape) do |pdf|
   pdf.font_size(25){  pdf.text "Name", :style => :bold}
 end