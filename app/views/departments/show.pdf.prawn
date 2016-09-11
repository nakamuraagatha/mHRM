prawn_document(:page_layout => :landscape) do |pdf|
  @department.to_pdf( pdf)
 render 'extend_demographies/show', :pdf=> pdf, extend_information: @department.extend_informations

end