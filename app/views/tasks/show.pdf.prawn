prawn_document(:page_layout => :landscape) do |pdf|
 @task.to_pdf(pdf)
end