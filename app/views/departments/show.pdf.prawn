prawn_document(:page_layout => :landscape) do |pdf|
  @department.to_pdf( pdf)
  pdf.move_down 10
  render 'extend_demographies/show', :pdf=> pdf, extend_information: @department.extend_informations
end