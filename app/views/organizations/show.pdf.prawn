prawn_document(:page_layout => :portrait) do |pdf|
  @organization.to_pdf(pdf)
  render 'extend_demographies/show', :pdf=> pdf, extend_information: @organization.extend_informations
end