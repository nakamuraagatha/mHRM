prawn_document(:page_layout => :landscape) do |pdf|
  User.current.to_pdf(pdf)
  pdf.move_down 10
  render 'extend_demographies/show', :pdf=> pdf, extend_information: User.current.extend_informations

   pdf.start_new_page
  User.current.affiliations.each do |a|
    a.to_pdf(pdf)
    pdf.move_down 10
  end
  pdf.start_new_page
   User.current.contacts.each do |a|
      a.to_pdf(pdf)
      pdf.move_down 10
      render 'extend_demographies/show', :pdf=> pdf, extend_information: a.extend_informations
      pdf.move_down 10
    end
  pdf.start_new_page
   User.current.certifications.each do |a|
      a.to_pdf(pdf)
      pdf.move_down 10
    end

  pdf.start_new_page
   User.current.clearances.each do |a|
      a.to_pdf(pdf)
      pdf.move_down 10
    end

  pdf.start_new_page
   User.current.languages.each do |a|
      a.to_pdf(pdf)
       pdf.move_down 10
    end

  pdf.start_new_page
   User.current.positions.each do |a|
     a.to_pdf(pdf)
       pdf.move_down 10
    end

  pdf.start_new_page
   User.current.other_skills.each do |a|
     a.to_pdf(pdf)
      pdf.move_down 10
    end

  pdf.start_new_page
end