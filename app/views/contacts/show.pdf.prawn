prawn_document(:page_layout => :portrait) do |pdf|
 @contact.to_pdf(pdf)
 render 'extend_demographies/show', :pdf=> pdf, extend_information: @contact.extend_informations
end