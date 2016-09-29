prawn_document(:page_layout => :landscape) do |pdf|
  User.current.to_pdf(pdf)
  pdf.move_down 10
  render 'extend_demographies/show', :pdf=> pdf, extend_information: User.current.extend_informations

  if User.current.affiliations.present?
      pdf.start_new_page
  end
  User.current.affiliations.each do |a|
    a.to_pdf(pdf)
    pdf.move_down 10
  end
  if User.current.contacts.present?
    pdf.start_new_page
     end
   User.current.contacts.each do |a|
      a.to_pdf(pdf)
      pdf.move_down 10
      render 'extend_demographies/show', :pdf=> pdf, extend_information: a.extend_informations
      pdf.move_down 10
    end

  if User.current.certifications.present?
    pdf.start_new_page
    end
   User.current.certifications.each do |a|
      a.to_pdf(pdf)
      pdf.move_down 10
    end

  if User.current.clearances.present?
     pdf.start_new_page
       end
   User.current.clearances.each do |a|
      a.to_pdf(pdf)
      pdf.move_down 10
    end

  if User.current.languages.present?
     pdf.start_new_page
       end
   User.current.languages.each do |a|
      a.to_pdf(pdf)
       pdf.move_down 10
    end

  if User.current.positions.present?
     pdf.start_new_page
     end
   User.current.positions.each do |a|
     a.to_pdf(pdf)
       pdf.move_down 10
    end

  if User.current.other_skills.present?
      pdf.start_new_page
        end
   User.current.other_skills.each do |a|
     a.to_pdf(pdf)
      pdf.move_down 10
    end
end