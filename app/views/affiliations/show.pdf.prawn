prawn_document(:page_layout => :landscape) do |pdf|
  @affiliation.to_pdf(pdf)

 render 'extend_demographies/show', :pdf=> pdf, extend_information: @affiliation.extend_informations

end