class Fax < ApplicationRecord
  belongs_to :fax_type
  belongs_to :extend_demography

  validates_presence_of :fax_number, :fax_type_id
  validates_uniqueness_of :fax_number, scope: [:fax_type_id, :extend_demography_id]
  validates_uniqueness_of :fax_type_id, scope: [:extend_demography_id]

  def self.safe_attributes
    [:id, :fax_type_id, :fax_number, :note, :_destroy]
  end

  def to_html
    output = "<div class='col-xs-12'>"
    output<< "<div class='col-xs-2'>#{fax_type} </div>"
    output<< "<div class='col-xs-8'>#{fax_number} </div>"
    output<< "</div>"
    output.html_safe
  end

  def to_pdf(pdf)
    pdf.text "<b>fax type:</b> #{fax_type}. <b>Fax number:</b> #{fax_number}", :inline_format =>  true
  end

end
