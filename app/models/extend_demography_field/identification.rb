class Identification < ApplicationRecord
  belongs_to :identification_type, optional: true
  belongs_to :issued_by_type, optional: true

  validates_presence_of :identification_number, :identification_type_id
  validates_uniqueness_of :identification_type_id, scope: [:extend_demography_id]

  def self.safe_attributes
    [:id, :identification_number, :status, :date_expired, :issued_by_type_id, :date_issued, :note, :identification_type_id, :_destroy]
  end

  def to_html
    output = "<div class='col-xs-12'>"
    output<< "<div class='col-xs-2'>#{identification_type} </div>"
    output<< "<div class='col-xs-2'>#{identification_number} </div>"
    output<< "<div class='col-xs-2'>#{status} </div>"
    output<< "<div class='col-xs-2'>#{date_expired} </div>"
    output<< "<div class='col-xs-2'>#{issued_by_type} </div>"
    output<< "<div class='col-xs-2'>#{date_issued} </div>"
    output<< "</div>"
    output.html_safe
  end

  def identification_type
    if identification_type_id
      super
    else
      IdentificationType.default
    end
  end

 def issued_by_type
    if issued_by_type_id
      super
    else
      IssuedByType.default
    end
  end



  def to_pdf(pdf)
    pdf.text "<b>Identification type:</b> #{identification_type}. <b>Id number:</b> #{identification_number}", :inline_format =>  true
  end

end
