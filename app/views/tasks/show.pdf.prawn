prawn_document(:page_layout => :portrait) do |pdf|
 @task.to_pdf(pdf)
end