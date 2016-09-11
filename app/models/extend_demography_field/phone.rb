class Phone < ApplicationRecord
  belongs_to :phone_type
  # belongs_to :extend_demography

  validates_presence_of :phone_number, :phone_type_id
  validates_uniqueness_of :phone_number, scope: [:phone_type_id, :extend_demography_id]
  validates_uniqueness_of :phone_type_id, scope: [:extend_demography_id]

  def self.safe_attributes
    [:id, :phone_type_id, :phone_number, :note, :_destroy]
  end

  def to_html
    output = "<div class='col-xs-12'>"
    output<< "<div class='col-xs-2'>#{phone_type} </div>"
    output<< "<div class='col-xs-8'>#{phone_number} </div>"
    output<< "</div>"
    output.html_safe
  end

  def to_pdf(pdf)
    pdf.text "<b>Phone type:</b> #{phone_type}. <b>Phone number:</b> #{phone_number}", :inline_format =>  true
  end

end
